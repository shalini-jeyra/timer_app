import 'dart:convert';

class Activity {
  String title;
  String description;
  DateTime activityTime;
  Activity({
    required this.title,
    required this.description,
    required this.activityTime,
  });

  Activity copyWith({
    String? title,
    String? description,
    DateTime? activityTime,
  }) {
    return Activity(
      title: title ?? this.title,
      description: description ?? this.description,
      activityTime: activityTime ?? this.activityTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'activityTime': activityTime.millisecondsSinceEpoch,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      title: map['title'],
      description: map['description'],
      activityTime: DateTime.fromMillisecondsSinceEpoch(map['activityTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));

  @override
  String toString() => 'Activity(title: $title, description: $description, activityTime: $activityTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Activity &&
      other.title == title &&
      other.description == description &&
      other.activityTime == activityTime;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ activityTime.hashCode;
}
