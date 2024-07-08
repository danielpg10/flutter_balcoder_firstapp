import 'package:balcoder_flutter/ui/user/widgets/popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter/utils/widgets/main_scaffold.dart';
import 'package:balcoder_flutter/utils/widgets/mixins/text_form_validator_mixin.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TextFieldValidators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Size _size;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final List<String> _options = ['Masculino', 'Femenino', 'Otros'];
  String? _selectedOption;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopupWidget(
          name: _nameController.text,
          email: _emailController.text,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return MainScaffold(
      titlePage: 'User Form',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: "Ingresa tu nombre",
              ),
              validator: validateRequired,
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: "Ingresa tu edad",
              ),
              validator: validateNumber,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: "Ingresa tu email",
              ),
              validator: validateEmail,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Ingresa tu contraseña",
              ),
              validator: validatePassword,
              obscureText: true,
            ),
            DropdownButtonFormField<String>(
              value: _selectedOption,
              items: _options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
              validator: (value) => value == null ? 'Por favor selecciona una opcion' : null,
              decoration: InputDecoration(
                labelText: 'Gender',
                hintText: 'Selecciona tu género',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("¡Formulario completo!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
