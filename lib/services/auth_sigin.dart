import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shortener/pages/home.dart';
import 'package:shortener/pages/signin.dart';

class Authservices {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const SignIn();
        }
      },
    );
  }

  signInWithGoogle() async {
    //begin interactive signin process
    final GoogleSignInAccount? gUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create a credential user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}

getImage() {
  if (FirebaseAuth.instance.currentUser!.photoURL == false) {
    return FirebaseAuth.instance.currentUser!.photoURL;
  } else {}
}
