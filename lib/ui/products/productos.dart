import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  bool _isAuthenticated = false; 
  String _userName = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(
        isAuthenticated: _isAuthenticated,
        userName: _userName,
      ),
      body: Center(
        child: Text("Aca van a ir todos los productos"),
      ),
    );
  }
}
