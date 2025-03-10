// lib/features/course/domain/entities/course.dart
class Course {
  final String title;
  final String description;
  final String instructor;
  final int duration;

  Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.duration,
  });
}