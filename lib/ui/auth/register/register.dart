import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';
import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/utils/mixins/text_form_validator_mixin.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TextFormValidator {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rpasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 800,
            width: 400,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Regístrate",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF152361),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Inicia sesión para ver el contenido",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152361),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Nombre completo",
                        hintText: "Por favor, ingresa tu nombre completo",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: validateName,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Correo electrónico",
                        hintText: "Por favor, ingresa tu correo electrónico",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: validateEmail,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        labelText: "Numero telefonico",
                        hintText: "Por favor, ingresa tu numero telefonico",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: validateNumber,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        labelText: "Edad",
                        hintText: "Por favor, ingresa tu edad",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: validateAge,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Contraseña",
                        hintText: "Por favor, ingresa tu contraseña",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: validatePassword,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _rpasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Repite contraseña",
                        hintText: "Por favor, repite tu contraseña",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: validateRPassword,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("¡Te has registrado correctamente!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      backgroundColor: AppConstat.secondColor,
                      foregroundColor: AppConstat.primaryColor,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('Registrarme'),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: const Text(
                      '¿Ya te has registrado?. Inicia sesión aquí.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF666F98),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
