import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user = await _auth.signInWithCredential(credential);
      return user;
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Sign-in with Google'),
          onPressed: googleSignIn,
        ),
      ),
    );
  }
}


// class LogIn extends StatefulWidget {
//   const LogIn({Key? key}) : super(key: key);
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Sign-in with Google'),
//           onPressed: googleSignIn,
//         ),
//       ),
//     );
//   }
// }
