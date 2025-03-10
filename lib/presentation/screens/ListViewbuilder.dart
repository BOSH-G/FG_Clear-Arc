import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../futuregate/presentation/provider.dart';

// الـ Provider اللي هنستخدمه

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // نجيب البيانات الأولية
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
    // نضيف listener علشان نتحكم في الـ scrolling
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // لو وصلنا لآخر العناصر، نجيب بيانات جديدة
      if (!_isLoading) {
        setState(() => _isLoading = true);
        Provider.of<UserProvider>(context, listen: false)
            .fetchMoreUsers()
            .then((_) {
          setState(() => _isLoading = false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.users.isEmpty && userProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (userProvider.users.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: userProvider.users.length + 1,
              itemBuilder: (context, index) {
                if (index == userProvider.users.length) {
                  return _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox();
                }
                var user = userProvider.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text("0"),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
