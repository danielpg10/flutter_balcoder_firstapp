import 'package:flutter/material.dart';
import 'package:balcoder_flutter/ui/user/user_page.dart';
import 'package:balcoder_flutter/utils/widgets/main_scaffold.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      titlePage: 'Home',
      showDrawer: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "¡Bienvenido Falcao a Millonarios!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 700, 
                  child: Image.network(
                    "https://files.alerta.rcnradio.com/alerta_bogota/public/2024-07/falcaoenmillonarios.jpg?ZibR5HMojfxCLlEKmaiifXN_Zl32zH28",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 700, 
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/0/05/Escudo_Millonarios_2021-2022.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
