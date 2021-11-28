import 'package:flutter/material.dart';
import 'package:timer_app/pages/activity_timer/activity_timer.dart';
import 'package:timer_app/pages/create_activity_page/create_activity_page_components/create_activity_components.dart';
import 'package:timer_app/services/activity_service.dart';
import 'package:timer_app/services/locator.dart';
import 'package:timer_app/styles/styles.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  DateTime _dateTime = DateTime.parse("0000-00-00 00:00:00");
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ActivityService activityService = locator<ActivityService>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
       elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: AppColors.secondary,),onPressed: (){
        Navigator.pop(context);
      },),),
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
              TextWidget(
                  controller: descriptionController, text: 'Description'),
              const SizedBox(
                height: 24,
              ),
              const Spacer(),
              NextButtonWidget(
                onPressed: () {
                  titleController.text = titleController.text.trim();
                  descriptionController.text =
                      descriptionController.text.trim();
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    activityService.saveActivityLocally(
                      titleController.text,
                      descriptionController.text,
                      _dateTime,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ActivityTimer(
                          title: titleController.text,
                          description: descriptionController.text,
                          activityTime: _dateTime,
                        ),
                      ),
                    );
                  }
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
