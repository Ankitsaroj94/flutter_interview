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
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    isLoading.value = true;
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      final uid = result.user?.uid;
      if (uid == null) {
        Get.snackbar("Error", "Login failed");
        return;
      }
      final data = await firestore.collection("Users").doc(uid).get();
      if (!data.exists) {
        Get.offAllNamed(Routes.COLLECT_USER_DETAILS);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOG_IN);
  }
}
