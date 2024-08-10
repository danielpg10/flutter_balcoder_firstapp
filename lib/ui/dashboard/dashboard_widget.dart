import 'package:balcoder_flutter_second/ui/dashboard/gallery/gallery.dart';
import 'package:balcoder_flutter_second/ui/dashboard/products/registerproducts.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';
import 'package:balcoder_flutter_second/ui/products/productos.dart';
import 'package:balcoder_flutter_second/ui/dashboard/gallery/gallery.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';

class DashboardWidget extends StatefulWidget {
  final bool isAuthenticated;
  final String userName;

  const DashboardWidget({
    Key? key,
    required this.isAuthenticated,
    required this.userName,
  }) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(
        isAuthenticated: widget.isAuthenticated, 
        userName: widget.userName,
      ),
      body: widget.isAuthenticated
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '¡Bienvenido, ${widget.userName}!',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GalleryWidget(
                                        isAuthenticated: widget.isAuthenticated,
                                        userName: widget.userName,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 8.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/image2.jpg',
                                        height: 350,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 8.0),
                                      const Text(
                                        'Visualización de la Galeria',
                                        style: AppConstat.titleStyle,
                                      ),
                                      const SizedBox(height: 8.0),
                                      const Text(
                                        'Tocando aquí podrás visualizar la galeria solicitada en la Tarea #2 del curso de Flutter con Balcoder.',
                                        style: AppConstat.subtitleStyle,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Registerproducts(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 8.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/image1.png',
                                        height: 350,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 8.0),
                                      const Text(
                                        'Registro de Productos',
                                        style:AppConstat.titleStyle,
                                      ),
                                      const SizedBox(height: 8.0),
                                      const Text(
                                        'Tocando aquí pobrarás el registro de productos solicitado en la Tarea #3 del curso de Flutter con Balcoder.',
                                        style: AppConstat.subtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : _buildLoginPrompt(context),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Por favor, inicia sesión para acceder a la galería.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()), 
              );
            },
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
