import 'package:firebase_auth/firebase_auth.dart'as auth;
import 'package:flutter/material.dart';
import 'package:growing_together/screens/screen_container.dart';
import 'package:intl/intl.dart';
import 'package:growing_together/user/user.dart';
import 'package:growing_together/user/user_dbops.dart';

class Onboarding extends StatefulWidget {
  final auth.User user;
  const Onboarding({Key? key, required this.user}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _childName = TextEditingController();
  TextEditingController _dob = TextEditingController();
  DateTime? datePicked;
  User? newUser;

  @override
  void initState() {
    _username.text = widget.user.displayName ?? "";
    _email.text = widget.user.email ?? "";

    super.initState();
  }

  bool validate() {
    print(_username.text );
    print(_email.text);
    print(_childName.text);
    print(_dob.text);
    print(_username.text != "" && _email.text != "" && _childName != "" && _dob != "");
    if(_username.text != "" && _email.text != "" && _childName.text != "" && _dob.text != "")
      return true;
    else return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _username,
                  decoration: const InputDecoration(
                    labelText: "Username"
                  ),
                ),
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                      labelText: "Email"
                  ),
                ),
                TextField(
                  controller: _childName,
                  decoration: const InputDecoration(
                      labelText: "Child's Name"
                  ),
                ),
                TextField(
                  controller: _dob,
                  decoration: const InputDecoration(
                      labelText: "Date of Birth"
                  ),
                  keyboardType: TextInputType.none,
                  onTap: () async {
                    datePicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101)
                    );
                    if(datePicked != null) {
                      setState(() {
                        _dob.text = formatter.format(datePicked!);
                      });
                    }
                  },
                ),

                SizedBox(height: 20,),
                OutlinedButton(onPressed: () async {
                  if(validate()) {
                    newUser = User(uid: widget.user.uid, username: _username.text, email: _email.text, childName: _childName.text, dob: datePicked!, remindersEnabled: false);
                    bool success = await UserDBOps.createUser(newUser!);
                    if(success) {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => ScreenContainer()), (route) => false);
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: Please make sure all the fields are valid")));
                    }
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: Please make sure all the fields are valid")));
                  }
                },
                child: Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
