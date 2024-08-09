import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/ui/dashboard/dashboard_widget.dart';
import 'package:balcoder_flutter_second/ui/products/productos.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';

class DrawerWidget extends StatelessWidget {
  final bool isAuthenticated;
  final String userName;

  const DrawerWidget({
    Key? key,
    required this.isAuthenticated,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 93, 173, 230),
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
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: userName),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_sharp, color: Colors.black),
            title: const Text("Productos"),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Productos()),
                );
              } 
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.black),
            title: const Text("Cuenta"),
            onTap: () {
              if (isAuthenticated) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardWidget(
                      isAuthenticated: isAuthenticated,
                      userName: userName,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
