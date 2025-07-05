import '../model/user_model.dart';

class UserController {
  static UserModel user = UserModel();

  void setDetails(String? name, String? email, String? number) {
    user.name = name;
    user.email = email;
    user.number = number;
  }
}
