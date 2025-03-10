import '../../data/repositories/institution_repository.dart';

class GetInstitutions {
  final InstitutionRepository repository;

  GetInstitutions(this.repository);

  Future<List<dynamic>> call() async => repository.getInstitutions();
}
