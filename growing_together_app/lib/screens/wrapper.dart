import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:growing_together/screens/onboarding.dart';
import 'package:growing_together/screens/screen_container.dart';
import 'package:growing_together/user/user_dbops.dart';
import '../screens/log_in_page.dart';

// import '../user/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  User? user;
  @override
  void initState() {
    super.initState();
    //Listen to Auth State changes
    FirebaseAuth.instance
        .authStateChanges().listen((event) => updateUserState(event));
  }
  //Updates state when user state changes in the app
  updateUserState(event) {
    setState(() {
      user = event;
    });
  }

  Future<void> redirect() async {
    if (await UserDBOps.userExists(user!.uid)) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => ScreenContainer()), (route) => false);
    }
    else {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Onboarding(user: user!)), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null)
      return LogIn();
    else {
      redirect();
      return Center(child: CircularProgressIndicator());
    }
    // return Home();
  }
}