import 'package:flutter/cupertino.dart';
import 'package:futuregate/futuregate/presentation/widgets/providers.dart';

import '../../usecases/usecase.dart';

class UserProvider with ChangeNotifier {
  final GetUsersUseCase _getUsersUseCase;

  List<User> _users = [];
  bool _isLoading = false;
  String? _error; // Allowing null value

  // Proper constructor initialization
  UserProvider(this._getUsersUseCase);

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null; // Clear previous errors before fetching new data
    notifyListeners();
    try {
      var result = await _getUsersUseCase.execute();
      if (result is List<User>) {
        _users = result as List<User>;
      } else {
        _error = "Invalid data format";
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoreUsers() async {
    if (_isLoading) return; // Prevent multiple fetch calls at the same time
    _isLoading = true;
    notifyListeners();
    try {
      var result = await _getUsersUseCase.execute();
      if (result is List<User>) {
        _users.addAll(result as Iterable<User>);
      } else {
        _error = "Invalid data format";
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
