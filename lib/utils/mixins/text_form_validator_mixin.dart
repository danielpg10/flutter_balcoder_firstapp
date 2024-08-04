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

String? validateDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu fecha de nacimiento';
  }

  final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!dateRegex.hasMatch(value)) {
    return 'Formato de fecha inválido. (dd/mm/yyyy)';
  }

  final parts = value.split('/');
  final day = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final year = int.tryParse(parts[2]);

  if (day == null || month == null || year == null) {
    return 'Por favor, pon una fecha';
  }

  final date = DateTime(year, month, day);
  if (date.year != year || date.month != month || date.day != day) {
    return 'Por favor, pon una fecha valida';
  }

  final today = DateTime.now();
  if (date.isAfter(today)) {
    return 'La fecha no puede ser en el futuro';
  }

  return null;
}


String? validatePassword(String? value) {
  final passwordRegex = RegExp(r'^[a-zA-Z0-9 ]+$'); 
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa una contraseña';
    } else if(!passwordRegex.hasMatch(value)){
      return 'Por favor, introduce una contraseña valida';
    }
  }
}