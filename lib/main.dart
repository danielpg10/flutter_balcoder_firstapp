import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/ui/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA7poToyt2buF5AQTfteCH8tyWwpAgWo5A",
      authDomain: "curso-firebase-balcoder.firebaseapp.com",
      projectId: "curso-firebase-balcoder",
      storageBucket: "curso-firebase-balcoder.appspot.com",
      messagingSenderId: "457278308739",
      appId: "1:457278308739:web:f1c87d82d20fa8018db6b6",
      measurementId: "G-YNW9RLJ38P"
    )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 47, 0, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
