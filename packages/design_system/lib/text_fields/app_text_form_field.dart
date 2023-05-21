import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? errorText;

  const AppTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.always,
      obscureText: obscureText,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        errorText: errorText,
        filled: true,
        fillColor: Colors.indigo.shade100,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
