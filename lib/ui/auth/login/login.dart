import 'package:balcoder_flutter/ui/auth/register/resgister.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter/utils/widgets/mixins/text_form_validator_mixin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TextFieldValidators {
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  const SizedBox(height: 16),
                  const Text(
                    '¿Olvidaste tu contraseña?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF666F98),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                          onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("¡Iniciaste sesion!"),
                      backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal:  24.0),
                      backgroundColor: const Color(0xFFADD9E6),
                      foregroundColor: const Color(0xFF152361),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: const Text(
                      '¿No tienes una cuenta? Regístrate aquí',
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
