import 'package:flutter/material.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: const Center(child: HomeContent()),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Welcome to Home!', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Get.toNamed(Routes.PROFILE),
          child: const Text("Go to Profile"),
        ),
      ],
    );
  }
}
