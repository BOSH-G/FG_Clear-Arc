// lib/features/course/domain/usecases/add_course.dart
import '../entities/courses.dart';
import '../repositories/course_repository.dart';

class AddCourse {
  final CourseRepository repository;

  AddCourse(this.repository);

  Future<void> call(Course course) async {
    await repository.addCourse(course);
  }
}
