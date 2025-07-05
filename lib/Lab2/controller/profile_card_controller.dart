import '../model/profile_card_model.dart';

class ProfileCardController {
  final ProfileCardModel _model = ProfileCardModel();

  String? validateName(String? value) => _model.validateName(value);
  String? validateEmail(String? value) => _model.validateEmail(value);
  String? validateNumber(String? value) => _model.validateNumber(value);
}
