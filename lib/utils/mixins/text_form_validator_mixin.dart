mixin TextFormValidator{
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) { 
      return 'Este campo es obligatorio';
    }
    return null;
  }

String? validateName(String? value) {
  String pattern = r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu nombre';
  } else if (!regex.hasMatch(value!)) {
    return 'Por favor, ingresa un nombre valido';
  }
}


String? validateEmail(String? value) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu correo electronico';
  } else if (!emailRegex.hasMatch(value)) {
    return 'Por favor, ingresa un correo electronico valido';
  }
}

String? validateNumber(String? value) {
  final numericRegex = RegExp(r'^\d+$');
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu numero';
  } else if(!numericRegex.hasMatch(value)) {
    return 'Por favor, ingresa solo numeros';
  }
}

String? validateAge(String? value) {
  final ageRegex = RegExp(r'^\d+$');
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu edad';
  } else if(!ageRegex.hasMatch(value)) {
    return 'Por favor, ingresa una edad valida';
  }
}

String? validatePassword(String? value) {
  final passwordRegex = RegExp(r'^[a-zA-Z0-9 ]+$'); 
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa una contraseña';
    } else if(!passwordRegex.hasMatch(value)){
      return 'Por favor, introduce una contraseña valida';
    }
  }

String? validateRPassword(String? value) {
  final passwordRegex = RegExp(r'^[a-zA-Z0-9 ]+$'); 
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa una contraseña';
    } else if(!passwordRegex.hasMatch(value)){
      return 'Por favor, introduce una contraseña valida';
    }
  }
}