import 'package:flutter/material.dart';

class ProviderInstructionText extends StatelessWidget {
  const ProviderInstructionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Register as a Provider",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          "Join our network to manage services and grow your bookings today!",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600], height: 1.5),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
