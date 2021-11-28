
import 'package:flutter/material.dart';
import 'package:timer_app/styles/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onPressed,required this.text,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: TextButton(
      
          onPressed: onPressed,
          child:  Text(text,
              style: TextFonts.secondaryText),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shape:const RoundedRectangleBorder(
    borderRadius: ButtonBorders.primaryBoxBorder,
        ) ,
              backgroundColor: BoxColor.secondary)),
    );
  }
}