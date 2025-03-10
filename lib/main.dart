import 'package:flutter/material.dart';
import 'package:futuregate/screens/institution_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'future gate',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InstitutionListScreen(),
    );
  }
}
