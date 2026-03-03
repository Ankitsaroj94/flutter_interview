import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_interview/app/data/models/user_model.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CollectUserDetailsController extends GetxController {
  final isLoading = false.obs;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> registerAsProvider() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) return;
    isLoading.value = true;
    try {
      // Get current user data
      final doc = await firestore.collection("Users").doc(uid).get();
      if (!doc.exists) {
        // If doc doesn't exist, create it with provider status
        final userModel = UserModel(
          email: auth.currentUser?.email,
          isProvider: 1,
        );
        await firestore.collection("Users").doc(uid).set(userModel.toJson());
      } else {
        // Just update isProvider
        await firestore.collection("Users").doc(uid).update({'is_provider': 1});
      }
      Get.offAllNamed(Routes.PROFILE);
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", "Registration failed");
    } finally {
      isLoading.value = false;
    }
  }

  void skip() {
    Get.offAllNamed(Routes.PROFILE);
  }
}
