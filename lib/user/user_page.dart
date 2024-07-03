import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String username;
  const UserPage({super.key,required this.username});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Diferencia'),
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              ListTile(
                title: Text('Practicas'),
              ),
              const SizedBox(
                height: 20,
              ),
                ListTile(
                title: Text(widget.username),
                onTap: () {
                 Navigator.pop(context);
                }
              )
            ],
          ),
        )
      ],
    ));
  }
}