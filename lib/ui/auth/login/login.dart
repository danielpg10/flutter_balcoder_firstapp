import 'package:balcoder_flutter_second/ui/auth/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';
import 'package:balcoder_flutter_second/utils/mixins/text_form_validator_mixin.dart';
import 'package:balcoder_flutter_second/ui/gallery/gallery_widget.dart';
import 'package:balcoder_flutter_second/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TextFormValidator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 380,
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
                    "Iniciar sesión",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF152361),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Usuario o email",
                        hintText: "Por favor, ingresa tu usuario o email",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        counterText: '',
                      ),
                      maxLength: 30,
                      validator: validateEmail,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        hintText: "Por favor, ingresa tu contraseña",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          }
                        ),
                        counterText: '',
                      ),
                      maxLength: 20,
                      validator: validatePassword,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _testAuth();
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
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: const Text(
                      '¿No tienes cuenta aún? Crea una aquí.',
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

  void _navigateToGallery() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryWidget(isAuthenticated: true),
      ),
    );
  }

  _testAuth() async {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        if (userCredential.user != null) {
          print(userCredential.user!.uid);
          _navigateToGallery();
        } else {
          print('Este usuario no existe');
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      print('ERROR');
    }
  }
}
