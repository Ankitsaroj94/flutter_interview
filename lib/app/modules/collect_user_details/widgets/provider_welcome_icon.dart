import 'package:flutter/material.dart';

class ProviderWelcomeIcon extends StatelessWidget {
  const ProviderWelcomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.withAlpha(15),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.business_center_rounded,
        size: 80,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
