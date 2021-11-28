import 'package:get_it/get_it.dart';
import 'package:timer_app/models/activity.dart';
import 'package:timer_app/services/services.dart';

  GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(ActivityService());}
