import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/collect_user_details_controller.dart';

class CollectUserDetailsView extends GetView<CollectUserDetailsController> {
  const CollectUserDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CollectUserDetailsView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller.address,
              decoration: InputDecoration(hint: Text("Please Enter Address")),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.saveUserData();
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
