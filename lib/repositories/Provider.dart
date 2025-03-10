import 'package:flutter/material.dart';

import '../futuregate/presentation/widgets/institution_tile.dart';
import '../usecases/usecase.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository;
  List<User> _users = [];
  bool _isLoading = false;
  int _page = 1;

  UserProvider(this._userRepository);

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();
    _users = await _userRepository.getUsers(_page, 10);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMoreUsers() async {
    _page++;
    var newUsers = await _userRepository.getUsers(_page, 10);
    _users.addAll(newUsers);
    notifyListeners();
  }
}

class UserRepository {
  final DatabaseHelper _databaseHelper;

  UserRepository(this._databaseHelper);

  Future<List<User>> getUsers(int page, int limit) async {
    var result = await _databaseHelper
        .query('SELECT * FROM Users LIMIT $limit OFFSET ${(page - 1) * limit}');
    return result.map((user) => User.fromJson(user)).toList();
  }
}
