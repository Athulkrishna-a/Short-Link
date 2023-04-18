import 'package:flutter/material.dart';
import 'package:shortener/pages/home.dart';
import 'package:shortener/pages/signin.dart';

import 'package:shortener/pages/widgets/onborad_st.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../services/auth_sigin.dart';

class OnboradScreen extends StatefulWidget {
  const OnboradScreen({super.key});

  @override
  State<OnboradScreen> createState() => _OnboradScreenState();
}

class _OnboradScreenState extends State<OnboradScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              OnboardPage(
                image: "assets/image/hello.png",
                title: "Hello welcome",
                discription:
                    "Thank you to each and every one of you for being here with us today. We are very pleased to be able to welcome those of you that have been with us for a long time",
              ),
              OnboardPage(
                image: "assets/image/url-shortener.png",
                title: "Url Shortener",
                discription:
                    "The idea is to minimize the web page address into something that's easier to remember",
              ),
              OnboardPage(
                image: "assets/image/qrcode.png",
                title: "Qr Generator",
                discription:
                    "generates or creates your QR Code wherein you can store a variety of data/information in your code",
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.jumpToPage(2);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    "assets/image/back.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Authservices().handleAuthState(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          "assets/image/enter.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 1),
                              curve: Curves.easeIn);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          "assets/image/next.png",
                          height: 20,
                          width: 20,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
