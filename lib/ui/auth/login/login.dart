import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Iniciar sesion",
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
                    decoration: const InputDecoration(
                      labelText: "Usuario o email",
                      hintText: "Por favor, ingresa tu usuario o email",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF666F98),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  child: TextFormField(
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
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("¡Ingresaste a tu cuenta exitosamente!"),
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
                  child: const Text('Entrar'),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    '¿No tienes cuenta aun?. Crea una aquí.',
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
    );
  }
}
