import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/ui/auth/register/register.dart';
import 'package:balcoder_flutter_second/ui/gallery/gallery_widget.dart';
import 'package:balcoder_flutter_second/ui/products/productos.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}


class _DrawerWidgetState extends State<DrawerWidget> {
  bool _isAuthenticated = false;

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
            onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Daniel')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.black),
            title: const Text("Cuenta"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone_outlined, color: Colors.black),
            title: const Text("Galeria"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryWidget(isAuthenticated: _isAuthenticated, userName: '',)));
            }
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_sharp, color: Colors.black),
            title: const Text("Productos"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Productos()));
            },
          ),
        ],
      ),
    );
  }
}
