import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_admin_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';
import 'package:balcoder_flutter_second/utils/mixins/text_form_validator_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registerproducts extends StatefulWidget {
  @override
  State<Registerproducts> createState() => _RegisterproductsState();
}

class _RegisterproductsState extends State<Registerproducts>
    with TextFormValidator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _isAuthenticated = true;
  final String _userName = 'Daniel';
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _subtitleController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  XFile? _imageFile;
  Uint8List? _imageBytes;

  final List<Map<String, dynamic>> _products = [];
  final ImagePicker _picker = ImagePicker();
  double _formHeight = 570;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _imageFile = image;
        _imageBytes = bytes;
      });
    }
  }

  void _registerProduct() async {
    if (_formKey.currentState!.validate()) {
      if (_imageBytes == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor, selecciona una imagen')),
        );
        return;
      }

      Map<String, dynamic> newProduct = {
        'title': _tituloController.text,
        'subtitle': _subtitleController.text,
        'description': _descriptionController.text,
        'url': _urlController.text,
        'imageBytes': _imageBytes,
      };

      setState(() {
        _products.add(newProduct);
        _tituloController.clear();
        _subtitleController.clear();
        _descriptionController.clear();
        _urlController.clear();
        _imageFile = null;
        _imageBytes = null;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Producto registrado exitosamente')),
        );
        _formHeight = 570;
      });

      // Guarda en Firebase
      try {
        await FirebaseFirestore.instance.collection('products').add({
          'title': newProduct['title'],
          'subtitle': newProduct['subtitle'],
          'description': newProduct['description'],
          'url': newProduct['url'],
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Producto registrado en Firestore')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar el producto en Firestore')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerAdminWidget(
          isAuthenticated: _isAuthenticated, userName: _userName),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _formHeight,
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
                child: SingleChildScrollView(
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
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _tituloController,
                        decoration: const InputDecoration(
                          labelText: "Título del producto",
                          hintText: "Por favor, ingresa el nombre del producto",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF666F98),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          counterText: '',
                        ),
                        maxLength: 25,
                        validator: validateTitulo,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Subtítulo (opcional)",
                          hintText:
                              "Por favor, ingresa un subtítulo si lo deseas",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF666F98),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          counterText: '',
                        ),
                        maxLength: 25,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          labelText: "Descripción",
                          hintText:
                              "Por favor, ingresa una descripción del producto",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF666F98),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          counterText: '',
                        ),
                        validator: validateDescription,
                        maxLength: 35,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _urlController,
                        decoration: const InputDecoration(
                          labelText: "URL relacionada (opcional)",
                          hintText: "Por favor, ingresa la URL",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF666F98),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          counterText: '',
                        ),
                        validator: validateUrl,
                        maxLength: 75,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _imageBytes != null
                                ? Container(
                                    width: 70,
                                    height: 70,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: MemoryImage(_imageBytes!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    color: Colors.grey[200],
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              _imageFile != null
                                  ? _imageFile!.name
                                  : 'No se ha seleccionado ninguna imagen',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: const Text('Seleccionar imagen'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _registerProduct,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          child: const Text(
                            "Registrar Producto",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const Text(
                        "Lista de Productos",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 180.0,
                          dataRowHeight: 100,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Imagen',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Título',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Subtítulo',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Descripción',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'URL',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: _products.map((product) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      image: DecorationImage(
                                        image:
                                            MemoryImage(product['imageBytes']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(Text(product['title'])),
                                DataCell(Text(product['subtitle'] ?? '')),
                                DataCell(Text(product['description'])),
                                DataCell(Text(product['url'] ?? '')),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
