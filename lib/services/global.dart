import 'package:hive/hive.dart' show Box;
import 'package:timer_app/services/hive.dart';

enum BOX_NAME{
  ACTIVITY_BOX,
}

class Global{
  static const hiveRepoStoragePath = 'timer_app';
static final Map<BOX_NAME, Box?> boxes = {
    BOX_NAME. ACTIVITY_BOX: HiveInstance.activityBox,};
}