import 'package:balcoder_flutter/user/user_page.dart';
import 'package:balcoder_flutter/utils/theme/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        titlePage: 'Home',
        showDrawer: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hola mundo'),
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              ListTile(
                title: Text('Balcoder'),
              ),
              const SizedBox(
                height: 20,
              ),
                ListTile(
                title: Text('Hola'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserPage(username: 'Daniel',)));
                }
              )
            ],
          ),
        )
      ],
    ));
  }
}