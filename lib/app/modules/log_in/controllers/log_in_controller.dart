import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final auth = FirebaseAuth.instance;

  final firestore = FirebaseFirestore.instance;

  Future<void> logIn() async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      final uid = result.user?.uid;
      if (uid == null) {
        return;
      }
      final data = await firestore.collection("Users").doc(uid).get();
      if (data.exists == false) {
        Get.toNamed(Routes.COLLECT_USER_DETAILS);
      } else {
        Get.toNamed(Routes.HOME);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
