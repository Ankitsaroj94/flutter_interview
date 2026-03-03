import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withAlpha(10),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.lock_person_rounded,
          size: 64,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
