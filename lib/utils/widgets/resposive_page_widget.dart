import 'package:balcoder_flutter/utils/widgets/responsive_screen_widget.dart';
import 'package:flutter/material.dart';

class ResponsivePageWidget extends StatefulWidget {
  final Widget desktop;
  final Widget mobileWidget;

  const ResponsivePageWidget(
    {super.key,
     required this.desktop,  required this.mobileWidget,
  });
  
  @override
  State<ResponsivePageWidget> createState() => _ResponsivePageWidgetState();
}

class _ResponsivePageWidgetState extends State<ResponsivePageWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenWidget(
      desktop: _desktopWidget(),
      smallPhone: _mobileWidget(),
      );
  }
  _desktopWidget() { 
    return widget.desktop;
    }

   _mobileWidget() { 
    return widget.mobileWidget;
    }
}