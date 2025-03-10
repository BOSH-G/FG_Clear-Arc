// lib/screens/places_screen.dart
import 'package:flutter/material.dart';

import '../../data/remote/models/place.dart';

// import '../models/place.dart';

class PlacesScreen extends StatelessWidget {
  final List<Place> places = [
    Place(
      name: "Route Academy",
      imageUrl:
          "https://www.youtube.com/channel/UCWvLGFpcdk-i5K-oMZRi7dg", // استبدل برابط الصورة الفعلي
      description:
          "Route Academy offers a variety of online courses focused on professional development.",
      review: "Great platform for learning new skills!",
    ),
    Place(
      name: "CLS",
      imageUrl:
          "https://www.facebook.com/CLSLearn/", // استبدل برابط الصورة الفعلي
      description:
          "CLS provides a range of courses aimed at enhancing career skills and knowledge.",
      review: "Comprehensive courses with experienced instructors.",
    ),
    Place(
      name: "Instant",
      imageUrl: "https://example.com/image3.jpg", // استبدل برابط الصورة الفعلي
      description:
          "Instant delivers quick, bite-sized courses across various subjects.",
      review: "Flexible learning for busy professionals.",
    ),
    Place(
      name: "MEC Academy",
      imageUrl: "https://example.com/image4.jpg", // استبدل برابط الصورة الفعلي
      description:
          "MEC Academy specializes in technical and vocational training.",
      review: "Hands-on training that prepares you for the job market.",
    ),
    Place(
      name: "Courses4Arab",
      imageUrl: "https://example.com/image5.jpg", // استبدل برابط الصورة الفعلي
      description:
          "Courses4Arab provides quality educational content in Arabic.",
      review: "Accessible and relevant for Arabic-speaking students.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Places'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(place.imageUrl),
                  SizedBox(height: 10),
                  Text(
                    place.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    place.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Review: ${place.review}",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
