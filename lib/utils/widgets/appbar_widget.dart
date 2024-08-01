import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:balcoder_flutter_second/ui/auth/register/register.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/theme/app_constats.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text("Aplicacion"),
          Spacer(),
          if (_isSearching)
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Aqui puedes buscar lo que desees',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                        _searchController.clear();
                      });
                    },
                  ),
                ),
                autofocus: true,
                onEditingComplete: () {
                  setState(() {
                    _isSearching = false;
                  });
                },
              ),
            )
          else
            Row(
              children: [
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio')));
                }, child: Text("Inicio")),
                SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Cuenta"),
                  style: TextButton.styleFrom(
                    foregroundColor: AppConstat.primaryColor,
                    backgroundColor: AppConstat.secondColor,
                    minimumSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
                SizedBox(width: 20),
        ],
      ),
    );
  }
}
