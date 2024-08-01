import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';
import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';

class HomePage extends StatelessWidget {
  final bool _isAuthenticated;

  const HomePage({
    Key? key,
    required bool isAuthenticated, 
  }) : _isAuthenticated = isAuthenticated, 
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: Center(
        child: _isAuthenticated ? 
          Text("Prueba de funcionamiento xd:v") : 
          _buildLoginPrompt(context),
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
