import 'package:flutter/material.dart';
import 'package:balcoder_flutter/ui/home/home_page.dart';
import 'package:balcoder_flutter/ui/user/user_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = 'tu_nombre_de_usuario'; // Aquí debes tener el nombre de usuario necesario

    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Menu'),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Form'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserPage(username: username)),
            );
          },
        ),
      ],
    );
  }
}
