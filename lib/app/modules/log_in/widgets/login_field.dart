import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isVisible;
  final VoidCallback? onToggleVisibility;
  final TextInputType keyboardType;

  const LoginField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.isVisible = false,
    this.onToggleVisibility,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !isVisible,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isVisible
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  size: 20,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }
}
