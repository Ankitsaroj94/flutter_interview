import 'package:flutter/material.dart';
import 'package:flutter_interview/app/modules/log_in/widgets/login_field.dart';
import 'package:flutter_interview/app/modules/log_in/widgets/login_header.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                const SizedBox(height: 32),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Log in to continue your journey",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 48),

                LoginField(
                  controller: controller.email,
                  label: "Email",
                  hintText: "Enter your email",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => LoginField(
                    controller: controller.password,
                    label: "Password",
                    hintText: "••••••••",
                    icon: Icons.lock_outline_rounded,
                    isPassword: true,
                    isVisible: controller.isPasswordVisible.value,
                    onToggleVisibility: () =>
                        controller.isPasswordVisible.toggle(),
                  ),
                ),
                const SizedBox(height: 40),

                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.logIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGN_UP),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.grey[600]),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
