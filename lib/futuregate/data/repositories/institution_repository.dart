import '../remote/models/institution_model.dart';

class InstitutionRepository {
  List<Institution> getInstitutions() {
    return [
      Institution('Route Academy'),
      Institution('Instant'),
      Institution('Information Technology Institute (ITI)'),
      Institution('The American University in Cairo (AUC)'),
      Institution('Cairo University'),
    ];
  }
}
