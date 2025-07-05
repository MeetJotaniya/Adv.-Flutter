class LoginModel {
  String? validateName(String value) {
    if(value.isEmpty){
      return "Please enter your name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  String? validateNumber(String value) {
    if (value.isEmpty) {
      return "Please enter your number";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "Please confirm your password";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}
