import 'package:growing_together/vaccine_tracker/vaccines.dart';
import 'package:intl/intl.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String childName;
  final DateTime dob;
  final bool remindersEnabled;
  Map<Vaccine, DateTime> vaccinationStatus = {};

  static final DateFormat formatter = DateFormat('dd-MM-yyyy');

  User({required this.uid, required this.username, required this.email, required this.childName, required this.dob, required this.remindersEnabled});

  User.fromJson(this.uid, Map<String, dynamic> object) :
      this.username = object['username'],
      this.email = object['email'],
      this.childName = object['childName'],
      this.dob = formatter.parse(object['dob']),
      this.remindersEnabled = object["remindersEnabled"];

  Map<String, dynamic> toJson() => {
      "uid": this.uid,
      "username": this.username,
      "email": this.email,
      "childName": this.childName,
      "dob": formatter.format(this.dob),
      "remindersEnabled": this.remindersEnabled,
  };
}