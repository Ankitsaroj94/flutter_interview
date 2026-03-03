import 'package:flutter/material.dart';
import 'package:flutter_interview/app/modules/collect_user_details/widgets/action_button.dart';
import 'package:flutter_interview/app/modules/collect_user_details/widgets/provider_instruction_text.dart';
import 'package:flutter_interview/app/modules/collect_user_details/widgets/provider_welcome_icon.dart';
import 'package:get/get.dart';

import '../controllers/collect_user_details_controller.dart';

class CollectUserDetailsView extends GetView<CollectUserDetailsController> {
  const CollectUserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProviderWelcomeIcon(),
              const SizedBox(height: 40),
              const ProviderInstructionText(),
              const SizedBox(height: 56),
              Obx(
                () => ActionButton(
                  label: "Register Now",
                  isLoading: controller.isLoading.value,
                  onPressed: controller.registerAsProvider,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: controller.skip,
                style: TextButton.styleFrom(foregroundColor: Colors.grey[500]),
                child: const Text(
                  "Skip for now",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
