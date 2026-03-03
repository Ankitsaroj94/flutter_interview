import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  Future<void> checkLogin() async {
    final user = FirebaseAuth.instance.currentUser?.uid;
    if (user == null) {
      Get.offAllNamed(Routes.SIGN_UP);
    } else {
      final data = await firestore.collection("Users").doc(user).get();
      if (data.exists == false) {
        Get.offAllNamed(Routes.COLLECT_USER_DETAILS);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }
}
