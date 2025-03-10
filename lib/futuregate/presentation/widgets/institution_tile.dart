import 'package:flutter/material.dart';
import 'package:futuregate/repositories/futuregates.dart';
import 'package:provider/provider.dart';

import '../../data/remote/models/institution_model.dart';
import '../provider.dart';

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

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(
          contextGetUsersUseCase(UserRepository(DatabaseHelper()))),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Dashboard'),
        ),
        body: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.users.isEmpty) {
              userProvider.fetchUsers();
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  var user = userProvider.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.name),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  contextGetUsersUseCase(UserRepository userRepository) {}
}

class DatabaseHelper {
  query(String s) {}
}
