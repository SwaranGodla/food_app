import 'package:get_it/get_it.dart';
import '../network/api_client.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<ApiClient>(ApiClient());
}