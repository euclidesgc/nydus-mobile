import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;

  const AppTextFormField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
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
