import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/app/data/models/user_model.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final name = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final pinCode = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final isProvider = 0.obs;
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> signUp() async {
    if (email.text.isEmpty ||
        password.text.isEmpty ||
        name.text.isEmpty ||
        lastName.text.isEmpty ||
        phone.text.isEmpty ||
        address.text.isEmpty ||
        pinCode.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    if (password.text != confirmPassword.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }
    isLoading.value = true;
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (result.user?.uid != null) {
        final userModel = UserModel(
          name: name.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phone: phone.text.trim(),
          address: address.text.trim(),
          pinCode: pinCode.text.trim(),
          isProvider: isProvider.value,
        );

        await firestore
            .collection("Users")
            .doc(result.user!.uid)
            .set(userModel.toJson());
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
