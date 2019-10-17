class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static bool _isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool _isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static String nameValidator(String name) {
    if (name.isEmpty) return '*Required';
    if (name.length < 3) return 'must not be less than 3 characters';
    return null;
  }

  static String emailValidator(String value) {
    if (value.isEmpty) return '*Required';
    if (!_isValidEmail(value))
      return '*Enter a valid email';
    else
      return null;
  }

  static String passwordValidator(String value) {
    if (value.isEmpty) return '*Required';
    if (value.length < 8) return '*must not be less than 8 characters.';
    if (!_isValidPassword(value))
      return '*must contain a character and digit .';
    else
      return null;
  }

  static String confirmPasswordValidator(
      String password, String otherPassword) {
    if (password.isEmpty) return '*Required';
    if (password.length < 8) return '*must not be less than 8 characters.';
    if (password != otherPassword) return 'Passwords doesn\'t match';
    if (!_isValidPassword(password))
      return '*must contain a character and digit .';
    else
      return null;
  }
}
