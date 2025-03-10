// lib/features/course/domain/repositories/course_repository.dart
import '../entities/courses.dart';

abstract class CourseRepository {
  Future<void> addCourse(Course course);
  Future<List<Course>> getCourses();
}
