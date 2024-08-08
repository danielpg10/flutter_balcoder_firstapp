import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';
import 'package:balcoder_flutter_second/ui/products/productos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text("Aplicacion"),
          const Spacer(),
          if (_isSearching)
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Aqui puedes buscar lo que desees',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                        _searchController.clear();
                      });
                    },
                  ),
                ),
                autofocus: true,
                onEditingComplete: () {
                  setState(() {
                    _isSearching = false;
                  });
                },
              ),
            )
          else
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                bool isAuthenticated = snapshot.hasData;
                return Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio')),
                        );
                      },
                      child: const Text("Inicio"),
                    ),
                    TextButton (
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Productos()));
                        },
                        child: const Text("Productos"),
                      ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        if (isAuthenticated) {
                          _signOutAndNavigateHome(context);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        }
                      },
                      child: Text(isAuthenticated ? "Salir" : "Cuenta"),
                      style: TextButton.styleFrom(
                        foregroundColor: AppConstat.primaryColor,
                        backgroundColor: AppConstat.secondColor,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  void _signOutAndNavigateHome(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio')),
      (Route<dynamic> route) => false,
    );
  }
}
