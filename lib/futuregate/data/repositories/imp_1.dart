// lib/features/course/data/repositories/course_repository_impl.dart
// import '../../domain/entities/course.dart';
import '../../domain/entities/courses.dart';
import '../../domain/repositories/course_repository.dart';
import '../models.dart';
// import '../models/course_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  final List<CourseModel> _courses = [];

  @override
  Future<void> addCourse(Course course) async {
    _courses.add(CourseModel(
      title: course.title,
      description: course.description,
      instructor: course.instructor,
      duration: course.duration,
    ));
  }

  @override
  Future<List<Course>> getCourses() async {
    return _courses;
  }
}
