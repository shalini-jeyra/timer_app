import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:timer_app/styles/styles.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({Key? key, required this.onTimeChange}) : super(key: key);
  final Function onTimeChange;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add time',
          style: HeaderFonts.secondaryHeader,
        ),
        TimePickerSpinner(
          time:  DateTime.parse("0000-00-00 00:00:00"),
          isShowSeconds: true,
          onTimeChange: onTimeChange as void Function(DateTime),
        )
      ],
    );
  }
}
