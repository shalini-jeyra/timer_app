import 'package:flutter/material.dart';
import 'package:timer_app/pages/create_activity_page/create_activity_page_components/create_activity_components.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  DateTime _dateTime = DateTime.now();
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          
            children: [
              TimePickerWidget(
                onTimeChange: (time) {
                  setState(() {
                    _dateTime = time;
                  });
                },
              ),
              TextWidget(controller: titleController, text: 'Title'),
              const SizedBox(
                height: 16,
              ),
              TextWidget(controller: titleController, text: 'Description'),
              const SizedBox(
                height: 24,
              ),
             Spacer(),
              ButtonWidget(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
