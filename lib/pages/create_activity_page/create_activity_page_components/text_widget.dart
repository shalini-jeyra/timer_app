import 'package:flutter/material.dart';
import 'package:timer_app/styles/styles.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.controller, required this.text})
      : super(key: key);
  final TextEditingController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: HeaderFonts.secondaryHeader,
        ),
        const SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color:BoxColor.primary, borderRadius: BoxBorders.primaryBoxBorder),
          child: TextFormField(
            
            controller: controller,
            onEditingComplete: () => FocusScope.of(context).unfocus(),
            validator: (input) {
              if (input!.length < 2) {
                return 'Please enter a longer password';
              }
              return null;
            },
            decoration: const InputDecoration(
              
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        )
      ],
    );
  }
}
