import 'package:flutter/material.dart';
import 'package:timer_app/styles/styles.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: ButtonBorders.primaryBoxBorder,
        ),
        primary: AppColors.ternary,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      ),
      child: Text(
        'Start ',
        style: TextFonts.secondaryText,
      ),
      onPressed: onPressed,
    );
  }
}
