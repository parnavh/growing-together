import 'package:flutter/material.dart';
import 'package:growing_together/screens/profile_page.dart';
import '../screens/home_page.dart';
import '../screens/pediatrician.dart';
// import 'package:growing_together/screens/vaccination_tracker.dart';
import '../screens/view_vaccines.dart';

class NavOptions {
  static final home = Home();
  static final vaccinationTracker = ViewVaccinesPage();
  static final pediatrician = Pediatrician();
  static final profile = ProfilePage();
  // static int selectedOption = 0;

  static final navBarTitles = ['Home', 'Vaccination Tracker', 'Consult', 'Profile'];

  static final navBarIcons = {
    'Home': Icons.home,
    'Vaccination Tracker': Icons.calendar_month_outlined,
    'Consult': Icons.chat,
    'Profile': Icons.account_circle_rounded
  };

  static final navBarOptions = {
    'Home': home,
    'Vaccination Tracker': vaccinationTracker,
    'Consult': pediatrician,
    'Profile': profile,
  };

}