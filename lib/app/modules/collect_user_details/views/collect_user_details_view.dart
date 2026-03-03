import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/collect_user_details_controller.dart';

class CollectUserDetailsView extends GetView<CollectUserDetailsController> {
  const CollectUserDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controller.address,
                decoration: const InputDecoration(
                  labelText: "Address",
                  hintText: "Enter your full address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.pinCode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Pin Code",
                  hintText: "Enter area pin code",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.saveUserData,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Complete Profile"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
