
import 'package:flutter/material.dart';
import 'package:timer_app/styles/styles.dart';

class NoActivityWidget extends StatelessWidget {
  const NoActivityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/no_activity.png',
            ),
          ),
          Flexible(
              child: Text(
            'No activity created??\nCreate your first activity \nby clicking the add button!!',
            textAlign: TextAlign.center,
            style: TextFonts.primaryText,
          )),
        ],
      ),
    );
  }
}
