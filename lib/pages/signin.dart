import 'package:flutter/material.dart';
import 'package:shortener/pages/widgets/onborad_st.dart';
import 'package:shortener/services/auth_sigin.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.yellowAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const OnboardPage(
                image: "assets/image/loop.png",
                title: "Simplify your links with Us ",
                discription:
                    "A URL shortener is a tool that takes a long and unwieldy URL (Uniform Resource Locator) and condenses it into a shorter, more manageable format. This shorter URL can be easier to share on social media, messaging apps, or other places where space is limited.",
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () => Authservices().signInWithGoogle(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/image/google.png",
                        height: 20,
                      ),
                      const Text(
                        "Continue ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
