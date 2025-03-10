import 'package:flutter/material.dart';

import '../futuregate/domain/entities/institution.dart';

class SpecializationScreen extends StatelessWidget {
  final Institution institution;

  const SpecializationScreen({super.key, required this.institution});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Specialization')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Back-end Development'),
            onTap: () {
              // Handle Back-end selection
            },
          ),
          ListTile(
            title: Text('Front-end Development'),
            onTap: () {
              // Handle Front-end selection
            },
          ),
          ListTile(
            title: Text('Full-stack Development'),
            onTap: () {
              // Handle Full-stack selection
            },
          ),
        ],
      ),
    );
  }
}
