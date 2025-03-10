import 'package:flutter/material.dart';
import 'package:futuregate/futuregate/domain/entities/institution.dart'; // Ensure you import the Institution entity
import 'package:futuregate/futuregate/presentation/widgets/institution_tile.dart';
import 'package:futuregate/screens/specialization_screen.dart';

class InstitutionListScreen extends StatefulWidget {
  const InstitutionListScreen({super.key});

  @override
  _InstitutionListScreenState createState() => _InstitutionListScreenState();
}

class _InstitutionListScreenState extends State<InstitutionListScreen> {
  late Future<List<Institution>> _institutionsFuture;

  var institution;

  @override
  void initState() {
    super.initState();
    _loadInstitutions();
  }

  void _loadInstitutions() {
    setState(() {
      _institutionsFuture = _institutionsFuture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select an Institution')),
      body: FutureBuilder<List<Institution>>(
        future: _institutionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the data is loading
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there was an error fetching the data
            print(
                'Error fetching institutions: ${snapshot.error}'); // Log the error
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'An error occurred while fetching institutions. Please try again later.'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadInstitutions, // Retry fetching data
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If there are no institutions available
            return Center(child: Text('No institutions available.'));
          } else {
            // Data is available
            final institutions = snapshot.data!;

            return ListView.builder(
              itemCount: institutions.length,
              itemBuilder: (context, index) {
                return InstitutionTile(
                  institution: institution,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpecializationScreen(
                          institution: institutions[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
