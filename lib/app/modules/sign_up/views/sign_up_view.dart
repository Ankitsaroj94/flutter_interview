import 'package:flutter/material.dart';
import 'package:flutter_interview/app/modules/sign_up/widgets/custom_text_form_field.dart';
import 'package:flutter_interview/app/modules/sign_up/widgets/section_title.dart';
import 'package:flutter_interview/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('New Account'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Join Us Today!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Complete the form to create your account",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),

              const SectionTitle(
                title: "Personal Info",
                icon: Icons.person_outline_rounded,
              ),
              CustomTextFormField(
                controller: controller.name,
                label: "First Name",
                hint: "Enter your first name",
                icon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.lastName,
                label: "Last Name",
                hint: "Enter your last name",
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.phone,
                label: "Phone",
                hint: "Enter your phone number",
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 32),

              const SectionTitle(
                title: "Account Details",
                icon: Icons.alternate_email_rounded,
              ),
              CustomTextFormField(
                controller: controller.email,
                label: "Email",
                hint: "Enter your email",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Obx(
                () => CustomTextFormField(
                  controller: controller.password,
                  label: "Password",
                  hint: "Create password",
                  isPassword: true,
                  isVisible: controller.isPasswordVisible.value,
                  icon: Icons.lock_outline_rounded,
                  onToggleVisibility: () =>
                      controller.isPasswordVisible.toggle(),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => CustomTextFormField(
                  controller: controller.confirmPassword,
                  label: "Confirm Password",
                  hint: "Re-enter password",
                  isPassword: true,
                  isVisible: controller.isConfirmPasswordVisible.value,
                  icon: Icons.lock_reset_rounded,
                  onToggleVisibility: () =>
                      controller.isConfirmPasswordVisible.toggle(),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CheckboxListTile(
                    title: const Text("Register as Provider?"),
                    secondary: Icon(
                      Icons.business_center_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    activeColor: Theme.of(context).primaryColor,
                    value: controller.isProvider.value == 1,
                    onChanged: (val) =>
                        controller.isProvider.value = (val ?? false) ? 1 : 0,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              const SectionTitle(
                title: "Contact Details",
                icon: Icons.location_on_outlined,
              ),
              CustomTextFormField(
                controller: controller.address,
                label: "Address",
                hint: "Enter your address",
                icon: Icons.home_outlined,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.pinCode,
                label: "Pin Code",
                hint: "Enter pin code",
                icon: Icons.map_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 48),

              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () => Get.offAllNamed(Routes.LOG_IN),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.grey[600]),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
