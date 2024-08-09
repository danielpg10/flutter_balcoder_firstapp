import 'package:balcoder_flutter_second/ui/dashboard/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/ui/products/productos.dart';
import 'package:balcoder_flutter_second/ui/dashboard/dashboard_widget.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';

class DrawerAdminWidget extends StatelessWidget {
  final bool isAuthenticated;
  final String userName;

  const DrawerAdminWidget({
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
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.black),
            title: const Text("Inicio"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardWidget(
                    isAuthenticated: isAuthenticated,
                    userName: userName,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_sharp, color: Colors.black),
            title: const Text("Registro Productos"),
            onTap: () {
              if (isAuthenticated) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Productos()),
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
