import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: padding,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(label)),
    );
  }
}
