import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SplashContent()),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(20),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.flash_on_rounded,
            size: 80,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 32),
        const CircularProgressIndicator(),
      ],
    );
  }
}
