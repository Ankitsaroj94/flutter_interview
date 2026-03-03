import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> logIn() async {
    log("Login attempt started...");
    if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
      log("Email or password empty");
      Get.snackbar(
        "Error",
        "Please fill all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    try {
      log("Signing in with Firebase: ${email.text.trim()}");
      final result = await auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      final uid = result.user?.uid;
      log("Sign in successful, uid: $uid");

      if (uid == null) {
        log("UID is null after login");
        Get.snackbar(
          "Error",
          "Login failed: No user ID returned",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      log("Fetching user data from Firestore...");
      final data = await firestore.collection("Users").doc(uid).get();
      log("Firestore document exists: ${data.exists}");

      if (!data.exists) {
        log("Redirecting to profile completion...");
        Get.offAllNamed(Routes.COLLECT_USER_DETAILS);
      } else {
        log("Redirecting to profile...");
        Get.offAllNamed(Routes.PROFILE);
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code} - ${e.message}");
      Get.snackbar(
        "Auth Error",
        e.message ?? "Authentication failed",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Login general error: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      log("Login attempt finished.");
    }
  }

  Future<void> logOut() async {
    log("Logging out...");
    await auth.signOut();
    Get.offAllNamed(Routes.LOG_IN);
  }
}
