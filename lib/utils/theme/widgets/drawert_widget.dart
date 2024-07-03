import 'package:balcoder_flutter/home/home_page.dart';
import 'package:balcoder_flutter/utils/theme/widgets/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Form'),
          onTap: () {
            
            Navigator.pushNamed(context, AppRoutes.form);
          },
        ),
      ],
    );
  }
}
