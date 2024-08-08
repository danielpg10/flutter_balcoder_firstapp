import 'package:balcoder_flutter_second/utils/routes/app_routes.dart';
import 'package:balcoder_flutter_second/ui/gallery/gallery_widget.dart';
import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA7poToyt2buF5AQTfteCH8tyWwpAgWo5A",
      authDomain: "curso-firebase-balcoder.firebaseapp.com",
      projectId: "curso-firebase-balcoder",
      storageBucket: "curso-firebase-balcoder.appspot.com",
      messagingSenderId: "457278308739",
      appId: "1:457278308739:web:f1c87d82d20fa8018db6b6",
      measurementId: "G-YNW9RLJ38P"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 47, 0, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthChecker(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
          String userName = user?.displayName ?? 'Usuario';
          return GalleryWidget(isAuthenticated: true, userName: userName);
        } else {
          return const Login();
        }
      },
    );
  }
}
