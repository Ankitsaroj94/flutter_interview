import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/app/data/models/user_model.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final name = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final pinCode = TextEditingController();
  final isProvider = 0.obs;
  final isLoading = false.obs;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) return;
    isLoading.value = true;
    try {
      final doc = await firestore.collection("Users").doc(uid).get();
      if (doc.exists) {
        final userModel = UserModel.fromJson(doc.data()!);
        name.text = userModel.name ?? '';
        lastName.text = userModel.lastName ?? '';
        phone.text = userModel.phone ?? '';
        address.text = userModel.address ?? '';
        pinCode.text = userModel.pinCode ?? '';
        isProvider.value = userModel.isProvider;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) return;
    isLoading.value = true;
    try {
      final userModel = UserModel(
        name: name.text,
        lastName: lastName.text,
        phone: phone.text,
        address: address.text,
        pinCode: pinCode.text,
        isProvider: isProvider.value,
      );
      await firestore.collection("Users").doc(uid).update(userModel.toJson());
      Get.snackbar("Success", "Profile updated successfully");
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", "Failed to update profile");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOG_IN);
  }
}
