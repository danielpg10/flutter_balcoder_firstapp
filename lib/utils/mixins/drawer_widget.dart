import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/ui/auth/register/register.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';

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
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Daniel',)),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.black,),
            title: const Text("Cuenta"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            },
          )
        ],
      ),
    );
  }
}
