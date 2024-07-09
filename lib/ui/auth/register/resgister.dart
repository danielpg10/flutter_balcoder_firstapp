import 'package:balcoder_flutter/ui/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter/utils/widgets/mixins/text_form_validator_mixin.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TextFieldValidators {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inscríbete',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF152361),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Explora temas de bienestar mental y reserva sesiones de forma segura',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF666F98),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre completo',
                        hintText: 'Ingresa tu nombre completo',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.w500,
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
                        labelText: 'Correo electrónico',
                        hintText: 'Ingresa tu correo electrónico',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: validateEmail,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Ingresa tu contraseña',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: validatePassword,
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
                      backgroundColor: const Color(0xFFADD9E6),
                      foregroundColor: const Color(0xFF152361),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
