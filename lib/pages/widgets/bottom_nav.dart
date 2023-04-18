import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 34),
      child: GNav(
        color: Colors.grey,
        activeColor: Colors.black,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 25,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.line_style_rounded,
          ),
          GButton(
            icon: Icons.qr_code,
          ),
          GButton(
            icon: Icons.account_circle_outlined,
          )
        ],
      ),
    );
  }
}
