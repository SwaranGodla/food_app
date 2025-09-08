import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String _selectedPaymentMethod = 'card';
  String _selectedTimeSlot = '30-45 min';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/cart'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address Section
            _buildSection(
              title: 'Delivery Address',
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: AppColors.primary),
                          const SizedBox(width: AppSizes.sm),
                          const Text(
                            'Home',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // Navigate to address selection
                            },
                            child: const Text('Change'),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.sm),
                      const Text(
                        '123 Main Street, Apartment 4B\nNew York, NY 10001',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.lg),

            // Delivery Time Section
            _buildSection(
              title: 'Delivery Time',
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    children: [
                      _buildTimeSlotOption('30-45 min', 'Fastest'),
                      const Divider(),
                      _buildTimeSlotOption('45-60 min', 'Standard'),
                      const Divider(),
                      _buildTimeSlotOption('60-90 min', 'Relaxed'),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.lg),

            // Payment Method Section
            _buildSection(
              title: 'Payment Method',
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    children: [
                      _buildPaymentOption('card', 'Credit/Debit Card', Icons.credit_card),
                      const Divider(),
                      _buildPaymentOption('upi', 'UPI', Icons.account_balance_wallet),
                      const Divider(),
                      _buildPaymentOption('cod', 'Cash on Delivery', Icons.money),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.lg),

            // Order Summary Section
            _buildSection(
              title: 'Order Summary',
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    children: [
                      _buildSummaryRow('Subtotal', '\$24.50'),
                      _buildSummaryRow('Delivery Fee', '\$2.99'),
                      _buildSummaryRow('Tax', '\$1.47'),
                      const Divider(),
                      _buildSummaryRow('Total', '\$28.96', isTotal: true),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.xl),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to order confirmation
                  context.go('/order-confirmation');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        child,
      ],
    );
  }

  Widget _buildTimeSlotOption(String time, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTimeSlot = time;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
        child: Row(
          children: [
            Radio<String>(
              value: time,
              groupValue: _selectedTimeSlot,
              onChanged: (value) {
                setState(() {
                  _selectedTimeSlot = value!;
                });
              },
            ),
            const SizedBox(width: AppSizes.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String value, String title, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: _selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue!;
                });
              },
            ),
            const SizedBox(width: AppSizes.sm),
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: AppSizes.sm),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
} 