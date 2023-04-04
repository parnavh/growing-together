import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class LoginState {
  late final SharedPreferences prefs;

  Future<bool> initialse() async {
    this.prefs = await SharedPreferences.getInstance();
    return true;
  }

  Future<bool> isLoggedIn() async {
    bool? loggedIn = await this.prefs.getBool('loggedIn');
    print(loggedIn);
    return loggedIn ?? false;
  }

  Future<bool> setLoggedIn(bool value) async {
    await this.prefs.setBool('loggedIn', value);
    return true;
  }
}
