import 'package:balcoder_flutter/utils/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';

class DesktopHomeWidgets extends StatefulWidget {
  const DesktopHomeWidgets({super.key});

  @override
  State<DesktopHomeWidgets> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DesktopHomeWidgets> {
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
