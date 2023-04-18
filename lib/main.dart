import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortener/pages/into_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shortener/pages/splash.dart';
import 'package:shortener/services/auth_sigin.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
