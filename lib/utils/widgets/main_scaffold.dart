import 'package:balcoder_flutter/utils/widgets/appbar_widget.dart';
import 'package:balcoder_flutter/utils/widgets/drawert_widget.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  final String titlePage;
  final bool showDrawer;

  const MainScaffold({
    super.key, 
    required this.child, 
    required this.titlePage, 
    this.showDrawer = false
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFADD9E6).withOpacity(0.65),
        title: const AppbarWidget(),
        leading: widget.showDrawer 
          ? Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
      ),
      drawer: widget.showDrawer ? const Drawer(child: DrawerWidget()) : null,
      body: widget.child,
    );
  } 
}
  