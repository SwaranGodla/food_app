import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../errors/app_exceptions.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: Duration(milliseconds: AppConstants.connectionTimeout),
        receiveTimeout: Duration(milliseconds: AppConstants.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    // Request Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token if available
          final token = _getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          
          // Add API key
          options.headers['X-API-Key'] = AppConstants.apiKey;
          
          print('🌐 API Request: ${options.method} ${options.path}');
          print('📤 Headers: ${options.headers}');
          print('📦 Data: ${options.data}');
          
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ API Response: ${response.statusCode} ${response.requestOptions.path}');
          print('📥 Data: ${response.data}');
          handler.next(response);
        },
        onError: (error, handler) {
          print('❌ API Error: ${error.response?.statusCode} ${error.requestOptions.path}');
          print('🚨 Error: ${error.message}');
          
          final exception = _handleError(error);
          handler.reject(exception);
        },
      ),
    );

    // Retry Interceptor
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retries: AppConstants.maxRetries,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 4),
        ],
      ),
    );
  }

  String? _getAuthToken() {
    // This will be implemented with proper storage service
    return null;
  }

  DioException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DioException(
          requestOptions: error.requestOptions,
          error: const NetworkException('Connection timeout'),
        );
      
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Server error';
        
        switch (statusCode) {
          case 400:
            return DioException(
              requestOptions: error.requestOptions,
              error: ValidationException(message),
            );
          case 401:
            return DioException(
              requestOptions: error.requestOptions,
              error: const AuthException('Unauthorized'),
            );
          case 403:
            return DioException(
              requestOptions: error.requestOptions,
              error: const AuthException('Forbidden'),
            );
          case 404:
            return DioException(
              requestOptions: error.requestOptions,
              error: ServerException('Resource not found'),
            );
          case 500:
          case 502:
          case 503:
            return DioException(
              requestOptions: error.requestOptions,
              error: ServerException(message),
            );
          default:
            return DioException(
              requestOptions: error.requestOptions,
              error: ServerException(message),
            );
        }
      
      case DioExceptionType.cancel:
        return DioException(
          requestOptions: error.requestOptions,
          error: const NetworkException('Request cancelled'),
        );
      
      case DioExceptionType.connectionError:
        return DioException(
          requestOptions: error.requestOptions,
          error: const NetworkException('No internet connection'),
        );
      
      case DioExceptionType.badCertificate:
        return DioException(
          requestOptions: error.requestOptions,
          error: const NetworkException('SSL certificate error'),
        );
      
      case DioExceptionType.unknown:
        return DioException(
          requestOptions: error.requestOptions,
          error: UnknownException(error.message ?? 'Unknown error'),
        );
    }
  }

  // GET Request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }

  // POST Request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }

  // PUT Request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }

  // PATCH Request
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }

  // DELETE Request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }

  // Upload File
  Future<Response> uploadFile(
    String path, {
    required String filePath,
    String? fileName,
    Map<String, dynamic>? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formDataObj = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        ...?formData,
      });

      final response = await _dio.post(
        path,
        data: formDataObj,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }

  // Download File
  Future<Response> downloadFile(
    String path, {
    required String savePath,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.download(
        path,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw e.error ?? UnknownException('Network error');
    }
  }
}

// Retry Interceptor for automatic retries
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final Function(String) logPrint;
  final int retries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    required this.logPrint,
    required this.retries,
    required this.retryDelays,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    var extra = err.requestOptions.extra;
    var retryCount = extra['retryCount'] ?? 0;

    if (_shouldRetry(err) && retryCount < retries) {
      extra['retryCount'] = retryCount + 1;
      
      logPrint('🔄 Retrying request (${retryCount + 1}/$retries)');
      
      await Future.delayed(retryDelays[retryCount]);
      
      try {
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.connectionError ||
           (err.response?.statusCode ?? 0) >= 500;
  }
} 