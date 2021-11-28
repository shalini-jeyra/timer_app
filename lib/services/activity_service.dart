import 'package:timer_app/models/activity.dart';
import 'package:timer_app/services/services.dart';

class ActivityService {
   saveActivityLocally(
      String title, String description, DateTime activityTime) async {
    String activityId = Utils.getSecureString(10);

    await Global.boxes[BOX_NAME.ACTIVITY_BOX]!.put(
      activityId,
      Activity(
        title: title,
        description: description,
        activityTime: activityTime,
        activityId: activityId,
      ),
    );
  }
}
