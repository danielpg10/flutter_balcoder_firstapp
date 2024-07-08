mixin TextFieldValidators {
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  String? validateNumber(String? value) {
    final numericRegex = RegExp(r'^\d+$');
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa un numero.';
    } else if (!numericRegex.hasMatch(value)) {
      return 'Por favor, ingresa solo números.';
    }
    return null;
  }

  String? validateName(String? value) {
    final nameRegex = RegExp(r'[0-9]');
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu nombre.';
    } else if (nameRegex.hasMatch(value)) {
      return 'El nombre no puede contener números.';
    }
    return null;
  }
}

String? validateEmail(String? value) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (value == null || value.isEmpty) {
    return 'Ingresa tu correo electrónico';
  } else if (!emailRegex.hasMatch(value)) {
    return 'Por favor, ingresa un correo electrónico válido.';
  }
  return null;
}

String? validatePassword(String? value) {
  final passwordRegex = RegExp(r'^[a-zA-Z0-9 ]+$');
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu contraseña';
  } else if (!passwordRegex.hasMatch(value)) {
    return 'La contraseña no puede contener caracteres especiales.';
  }
  return null;
}
