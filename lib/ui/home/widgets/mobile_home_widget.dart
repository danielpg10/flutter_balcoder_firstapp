import 'package:balcoder_flutter/ui/home/widgets/testimonial_widget.dart';
import 'package:flutter/material.dart';

class MobileHomeWidgets extends StatefulWidget {
  const MobileHomeWidgets({super.key});

  @override
  State<MobileHomeWidgets> createState() => _MobileHomeWidgetsState();
}

class _MobileHomeWidgetsState extends State<MobileHomeWidgets> {
  @override
  Widget build(BuildContext context) {
    return const TestimonialWidget();
  }
}