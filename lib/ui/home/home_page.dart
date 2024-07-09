import 'package:balcoder_flutter/ui/home/widgets/desktop_home_widgets.dart';
import 'package:balcoder_flutter/ui/home/widgets/mobile_home_widget.dart';
import 'package:balcoder_flutter/utils/widgets/responsive_screen_widget.dart';
import 'package:balcoder_flutter/utils/widgets/resposive_page_widget.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsivePageWidget(
        desktop: DesktopHomeWidgets(),
        mobileWidget: MobileHomeWidgets(),
      );
  }
}
