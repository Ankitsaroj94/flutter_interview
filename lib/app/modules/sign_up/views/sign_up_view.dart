import 'package:flutter/material.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUpView'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.deepOrange.shade300),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.deepOrange.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.deepOrange.shade300),
                ),
                hint: Text("Enter Your Email"),
              ),
            ),
            TextField(
              controller: controller.password,
              decoration: InputDecoration(hint: Text("Enter Your Password")),
            ),
            TextField(
              controller: controller.confirmPassword,
              decoration: InputDecoration(hint: Text("Confirm Your Email")),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.signUp();
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOG_IN);
              },
              child: Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}
