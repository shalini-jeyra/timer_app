import 'dart:convert';

import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 0)
class Activity {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime activityTime;
  @HiveField(3)
  String activityId;
  Activity({
    required this.title,
    required this.description,
    required this.activityTime,
    required this.activityId,
  });


  Activity copyWith({
    String? title,
    String? description,
    DateTime? activityTime,
    String? activityId,
  }) {
    return Activity(
      title: title ?? this.title,
      description: description ?? this.description,
      activityTime: activityTime ?? this.activityTime,
      activityId: activityId ?? this.activityId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'activityTime': activityTime.millisecondsSinceEpoch,
      'activityId': activityId,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      title: map['title'],
      description: map['description'],
      activityTime: DateTime.fromMillisecondsSinceEpoch(map['activityTime']),
      activityId: map['activityId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Activity(title: $title, description: $description, activityTime: $activityTime, activityId: $activityId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Activity &&
      other.title == title &&
      other.description == description &&
      other.activityTime == activityTime &&
      other.activityId == activityId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      activityTime.hashCode ^
      activityId.hashCode;
  }
}
