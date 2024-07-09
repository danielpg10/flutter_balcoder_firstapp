import 'package:balcoder_flutter/utils/widgets/device_info.dart';
import 'package:flutter/material.dart';

class ResponsiveScreenWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget desktop;
  final Widget? monitor;
  final Widget? largePhone;
  final Widget? smallPhone;

  const ResponsiveScreenWidget({
    super.key, 
    this.appBar, 
    required this.desktop, 
    this.smallPhone, 
    this.monitor, 
    this.largePhone
  });

  @override
  Widget build(BuildContext context) {
    // print(DeviceScreen.get(context));
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (DeviceScreen.isPhone(context) || DeviceScreen.isTablet(context)) {
            return _buildMobileLayout();
          } else {
            return _buildTabletDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    if (smallPhone != null) {
      return smallPhone!;
    } else {
      return Container(
        color: Colors.grey,
      );
    }
  }

  Widget _buildTabletDesktopLayout() {
    return desktop;
  }
}
