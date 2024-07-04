mixin TextFieldValidators {
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }

  String? validateNumber(String? value) {
    final numericRegex = RegExp(r'^\d+$');
    if (value == null || value.isEmpty) {
      return 'Please enter a number.';
    } else if (!numericRegex.hasMatch(value)) {
      return 'Please enter only numbers.';
    }
    return null;
  }
}

String? validateEmail(String? value) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
}
