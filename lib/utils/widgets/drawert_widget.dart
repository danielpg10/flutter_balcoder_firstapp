import 'package:balcoder_flutter/ui/auth/login/login.dart';
import 'package:balcoder_flutter/ui/auth/register/resgister.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter/ui/home/home_page.dart';
import 'package:balcoder_flutter/ui/user/user_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = 'Daniel';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100, 
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF0040FF),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.black),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
/*         ListTile(
            leading: const Icon(Icons.edit_document, color: Colors.black),
            title: const Text('Form'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UserPage(username: username)), 
                    
              );
            },
          ), */
          ListTile(
            leading: const Icon(Icons.logout_outlined, color: Colors.black),
            title: const Text('Login'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration, color: Colors.black),
            title: const Text('Register'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
