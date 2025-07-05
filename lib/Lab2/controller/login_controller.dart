import '../model/login_model.dart';

class LoginController {
  final LoginModel _model = LoginModel();

  String? validateName(String value) => _model.validateName(value);
  String? validateEmail(String value) => _model.validateEmail(value);
  String? validateNumber(String value) => _model.validateNumber(value);
  String? validatePassword(String value) => _model.validatePassword(value);
  String? validateConfirmPassword(String password, String confirmPassword) =>
      _model.validateConfirmPassword(password, confirmPassword);
}