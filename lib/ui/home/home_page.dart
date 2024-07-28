import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Container(
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20.0)),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [ 
                Text("Debe crear una cuenta para ver el contenido"),
                ElevatedButton(onPressed:() {  
                }, 
                child: Text("Registrate aqui"))
              ],
            )
          ),
          ),
          );
  } 
}
