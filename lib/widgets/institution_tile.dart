import 'package:flutter/material.dart';

import '../futuregate/domain/entities/institution.dart';

class InstitutionTile extends StatelessWidget {
  final Institution institution;
  final VoidCallback onTap;

  InstitutionTile({required this.institution, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(institution.name),
      onTap: onTap,
    );
  }
}
