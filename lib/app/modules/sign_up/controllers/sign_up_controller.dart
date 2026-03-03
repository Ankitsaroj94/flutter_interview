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
    log("Sign-up attempt started...");

    // Check for empty fields
    if (email.text.trim().isEmpty ||
        password.text.trim().isEmpty ||
        name.text.trim().isEmpty ||
        lastName.text.trim().isEmpty ||
        phone.text.trim().isEmpty ||
        address.text.trim().isEmpty ||
        pinCode.text.trim().isEmpty) {
      log(
        "A field is empty - email: ${email.text.isEmpty}, password: ${password.text.isEmpty}, name: ${name.text.isEmpty}",
      );
      Get.snackbar(
        "Required",
        "All fields must be filled to create an account",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (password.text != confirmPassword.text) {
      log("Passwords do not match");
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      log("Creating user in Auth: ${email.text.trim()}");
      final result = await auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      final uid = result.user?.uid;
      log("User created successfully, uid: $uid");

      if (uid != null) {
        log("Saving user data to Firestore...");
        final userModel = UserModel(
          name: name.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phone: phone.text.trim(),
          address: address.text.trim(),
          pinCode: pinCode.text.trim(),
          isProvider: isProvider.value,
        );

        await firestore.collection("Users").doc(uid).set(userModel.toJson());
        log("UserData saved successfully to collection 'Users'");

        Get.offAllNamed(Routes.LOG_IN);
        Get.snackbar(
          "Welcome!",
          "Your account has been created. Please log in.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException - sign up: ${e.code} - ${e.message}");
      Get.snackbar(
        "Auth Error",
        e.message ?? "Registration failed",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      log("Sign up general error: $e");
      Get.snackbar(
        "Wait",
        "Could not complete registration. Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
      log("Sign-up attempt finished.");
    }
  }
}
