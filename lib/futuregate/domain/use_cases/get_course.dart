// lib/features/course/domain/usecases/get_courses.dart
import '../entities/courses.dart';
import '../repositories/course_repository.dart';

class GetCourses {
  final CourseRepository repository;

  GetCourses(this.repository);

  Future<List<Course>> call() async {
    return await repository.getCourses();
  }
}
