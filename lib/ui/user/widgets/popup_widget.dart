import 'package:balcoder_flutter/utils/theme/app_constats.dart';
import 'package:flutter/material.dart';

class PopupWidget extends StatefulWidget {
  final String name;
  final String email;

  const PopupWidget({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Form information'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
 
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.primaryColor,
            foregroundColor: AppConstants.secondColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
