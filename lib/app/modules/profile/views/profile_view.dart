import 'package:flutter/material.dart';
import 'package:flutter_interview/app/modules/profile/widgets/profile_field.dart';
import 'package:flutter_interview/app/modules/profile/widgets/section_card.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () => controller.logOut(),
            icon: const Icon(Icons.logout_rounded, color: Colors.black87),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    SectionCard(
                      title: "Personal Information",
                      children: [
                        ProfileField(
                          controller: controller.name,
                          label: "First Name",
                          hint: "Enter your first name",
                          icon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 16),
                        ProfileField(
                          controller: controller.lastName,
                          label: "Last Name",
                          hint: "Enter your last name",
                          icon: Icons.person_rounded,
                        ),
                        const SizedBox(height: 16),
                        ProfileField(
                          controller: controller.phone,
                          label: "Phone Number",
                          hint: "Enter your phone number",
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: "Contact & Status",
                      children: [
                        ProfileField(
                          controller: controller.address,
                          label: "Address",
                          hint: "Enter your address",
                          icon: Icons.home_outlined,
                        ),
                        const SizedBox(height: 16),
                        ProfileField(
                          controller: controller.pinCode,
                          label: "Pin Code",
                          hint: "Enter pin code",
                          icon: Icons.map_outlined,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CheckboxListTile(
                            title: const Text("Register as Provider?"),
                            activeColor: Theme.of(context).primaryColor,
                            value: controller.isProvider.value == 1,
                            onChanged: (val) => controller.isProvider.value =
                                (val ?? false) ? 1 : 0,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => controller.updateProfile(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Update Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
    );
  }
}
