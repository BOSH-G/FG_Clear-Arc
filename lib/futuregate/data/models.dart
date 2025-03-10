// lib/features/course/data/models/course_model.dart
// import '../../domain/entities/course.dart';

import '../domain/entities/courses.dart';

class CourseModel extends Course {
  CourseModel({
    required String title,
    required String description,
    required String instructor,
    required int duration,
  }) : super(
          title: title,
          description: description,
          instructor: instructor,
          duration: duration,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'],
      description: json['description'],
      instructor: json['instructor'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'instructor': instructor,
      'duration': duration,
    };
  }
}
