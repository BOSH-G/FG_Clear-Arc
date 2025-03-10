import 'package:futuregate/repositories/Provider.dart';

class GetUsersUseCase {
  final UserRepository _userRepository;

  GetUsersUseCase(this._userRepository);

  Future<UserRepository> execute() async {
    try {
      return _userRepository;
    } catch (e) {
      throw Exception('Use Case Error: $e');
    }
  }
}
