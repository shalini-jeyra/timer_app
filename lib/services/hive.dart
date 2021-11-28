import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer_app/models/activity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'global.dart';

class HiveInstance {
  static Box<Activity>? _activityBox;
  static Box<Activity>? get activityBox => _activityBox;
  static initializeHive() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String hiveRepoPath = p.join(appDocDir.path, Global.hiveRepoStoragePath);
    await Hive.initFlutter(hiveRepoPath);
    Hive.registerAdapter(ActivityAdapter());
    _activityBox = await Hive.openBox('activityBox');
  }

  static clearHive() {
    _activityBox?.clear();
  }
}
