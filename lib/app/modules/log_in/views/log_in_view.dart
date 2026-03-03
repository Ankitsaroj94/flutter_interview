import 'package:flutter/material.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LogInView'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller.email,
              decoration: InputDecoration(hint: Text("Enter your Email")),
            ),
            TextField(
              controller: controller.password,
              decoration: InputDecoration(hint: Text("Enter your Password")),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.logIn();
              },
              child: Text("Log In"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SIGN_UP);
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.logOut();
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
