import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../services/auth_sigin.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child:
                  Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            ),
            Column(
              children: [
                Text(FirebaseAuth.instance.currentUser!.displayName!),
                const SizedBox(
                  height: 15.0,
                ),
                Text(FirebaseAuth.instance.currentUser!.email!),
              ],
            )
          ],
        ),
        Column(
          children: const [
            Text(
              "Short Link 😎",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "version 1.0.0.0 ",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "developed by ",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "coderX ✌️",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.0),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Authservices().signOut(),
          child: Container(
            height: 55,
            width: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.greenAccent),
            child: const Center(
              child: Text(
                "SIGN OUT ",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
