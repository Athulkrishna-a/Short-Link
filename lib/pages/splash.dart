import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shortener/pages/home.dart';
import 'package:shortener/pages/into_page.dart';
import 'package:shortener/pages/signin.dart';

import '../services/auth_sigin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get isViwed => null;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return isViwed != 0
                ? const OnboradScreen()
                : Authservices().handleAuthState();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/logo/loading.json"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              const Text(
                "Short Link",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Made By coderX  ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
