import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/app/data/models/user_model.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CollectUserDetailsController extends GetxController {
  final address = TextEditingController();
  final pinCode = TextEditingController();
  final isLoading = false.obs;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> saveUserData() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) return;
    isLoading.value = true;
    try {
      final userModel = UserModel(
        email: auth.currentUser?.email,
        address: address.text,
        pinCode: pinCode.text,
      );
      await firestore.collection("Users").doc(uid).set(userModel.toJson());
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", "Failed to save details");
    } finally {
      isLoading.value = false;
    }
  }
}
