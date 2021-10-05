class Validator {
  static bool validateEmail(String email) => RegExp(r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$").hasMatch(email);

  static bool validatePassword(String password) => RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])[A-Za-z\d#$@!%&*?]{6,}$").hasMatch(password);

  static bool validatePhone(String phone) => RegExp(r"^\+{1}[0-9+]+$").hasMatch(phone);
}
