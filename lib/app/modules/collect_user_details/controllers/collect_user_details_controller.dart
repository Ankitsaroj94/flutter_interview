import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectUserDetailsController extends GetxController {
  final address = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> saveUserData() async {
    try {
      final result = auth.currentUser?.uid;
      final uid = result;
      if (uid == null) {
        return;
      }
      final data = firestore.collection("Users").doc(uid);
      await data.set({"address": address.text});
    } catch (e) {
      log(e.toString());
    }
  }
}
