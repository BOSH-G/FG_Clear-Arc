// lib/features/course/presentation/screens/course_screen.dart
import 'package:flutter/material.dart';

import '../../data/repositories/imp_1.dart';
import '../../domain/entities/courses.dart';
import '../../domain/use_cases/add_course.dart';
import '../../domain/use_cases/get_course.dart';

// import '../../data/repositories/course_repository_impl.dart';
// import '../../domain/entities/course.dart';
// import '../../domain/usecases/add_course.dart';
// import '../../domain/usecases/get_courses.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController instructorController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    final getCourses = GetCourses(CourseRepositoryImpl());
    courses = await getCourses.call();
    setState(() {});
  }

  void _addCourse() {
    final title = titleController.text;
    final description = descriptionController.text;
    final instructor = instructorController.text;
    final duration = int.tryParse(durationController.text) ?? 0;

    if (title.isNotEmpty &&
        description.isNotEmpty &&
        instructor.isNotEmpty &&
        duration > 0) {
      final course = Course(
        title: title,
        description: description,
        instructor: instructor,
        duration: duration,
      );

      final addCourse = AddCourse(CourseRepositoryImpl());
      addCourse.call(course);
      titleController.clear();
      descriptionController.clear();
      instructorController.clear();
      durationController.clear();
      _loadCourses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Course Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Course Description'),
            ),
            TextField(
              controller: instructorController,
              decoration: InputDecoration(labelText: 'Instructor Name'),
            ),
            TextField(
              controller: durationController,
              decoration: InputDecoration(labelText: 'Duration (hours)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCourse,
              child: Text('Add Course'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return ListTile(
                    title: Text(course.title),
                    subtitle: Text(
                      '${course.description}\nInstructor: ${course.instructor}\nDuration: ${course.duration} hours',
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
