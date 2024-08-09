import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_admin_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';

class Registerproducts extends StatefulWidget {
  @override
  State<Registerproducts> createState() => _RegisterproductsState();
}

class _RegisterproductsState extends State<Registerproducts> {
  final bool _isAuthenticated = true; 
  final String _userName = 'Daniel'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerAdminWidget(
        isAuthenticated: _isAuthenticated,
        userName: _userName,
      ),

    );
  }
}
