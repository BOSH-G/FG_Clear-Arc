import 'package:futuregate/usecases/usecase.dart';

import '../futuregate/presentation/widgets/institution_tile.dart';

class UserRepository {
  final DatabaseHelper _databaseHelper;

  UserRepository(this._databaseHelper);

  Future<List<User>> getUsers() async {
    var result = await _databaseHelper.query('SELECT * FROM Users');
    return result.map((user) => ()).toList();
  }
}

extension on DatabaseHelper {
  query(String s) {}
}
