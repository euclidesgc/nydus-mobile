import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
