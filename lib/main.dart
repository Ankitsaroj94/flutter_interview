import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log(e.toString());
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Demo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
