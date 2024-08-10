import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_admin_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';

class Registerproducts extends StatefulWidget {
  @override
  State<Registerproducts> createState() => _RegisterproductsState();
}

class _RegisterproductsState extends State<Registerproducts> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: 400,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Registro de Productos",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Título del producto",
                        hintText: "Por favor, ingresa el nombre del producto",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        counterText: '',
                      ),
                      maxLength: 25,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Subtítulo (opcional)",
                        hintText: "Por favor, ingresa un subtítulo si lo deseas",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        counterText: '',
                      ),
                      maxLength: 25,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Descripción",
                        hintText: "Por favor, ingresa una descripción del producto",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        counterText: '',
                      ),
                      maxLength: 25,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Imagen del producto",
                        hintText: "Por favor, sube una imagen del producto",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        counterText: '',
                      ),
                      maxLength: 25,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "URL relacionada",
                        hintText: "Por favor, ingresa la URL",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666F98),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        counterText: '',
                      ),
                      maxLength: 25,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: AppConstat.primaryColor,
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: const Text(
                          "Registrar Producto",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 840,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Lista de productos",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
