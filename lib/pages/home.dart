import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortener/pages/link.dart';
import 'package:shortener/pages/profile.dart';
import 'package:shortener/pages/qr_code.dart';
import 'package:shortener/pages/widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navBottom(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShortLink(),
    const QrCode(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: const Text(
          "Short Link",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.yellow[200],
        ),
        leading: const Icon(
          Icons.search_off_rounded,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navBottom(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
