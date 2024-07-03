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
        title: Text(widget.titlePage),
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
      drawer: widget.showDrawer ? const Drawer() : null,
      body: widget.child,
    );
  }
}
