import 'package:flutter/material.dart';
import 'package:timer_app/models/activity.dart';
import 'package:timer_app/pages/activity_timer/activity_timer.dart';
import 'package:timer_app/pages/home_page/home_page_components/home_page_components.dart';
import 'package:timer_app/services/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListActivity extends StatelessWidget {
  const ListActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Global.boxes[BOX_NAME.ACTIVITY_BOX]!.listenable(),
        builder: (context, Box box, child) {
          if (box.isNotEmpty) {
            List<Activity> activities =
                List<Activity>.from(box.values).toList();
            return ListView.separated(
                shrinkWrap: true,
                itemCount: activities.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(activities[index].title),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ActivityTimer(
                                title: activities[index].title,
                                description: activities[index].description,
                                activityTime: activities[index].activityTime),
                          ),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                });
          }
          return const NoActivityWidget();
        });
  }
}
