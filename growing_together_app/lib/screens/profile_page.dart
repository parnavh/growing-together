// import 'package:firebase_auth/firebase_auth.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:growing_together/screens/wrapper.dart';
import 'package:growing_together/ui_utils/colors.dart';
import 'package:growing_together/user/user.dart';
import 'package:growing_together/user/user_dbops.dart';
import 'package:intl/intl.dart';

import '../vaccine_tracker/vaccine_data.dart';
import '../vaccine_tracker/vaccines.dart';
import 'enable_reminder.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  List<int> days = [];
  bool onlyMandatory = false;
  bool addingRems = false;
  late Future<User> user;


  void selectRemindersCallback(List<int> remDays, bool mandatory) {
    days = remDays;
    onlyMandatory = mandatory;
    setState(() {
      addingRems = true;
    });
    setReminders();
  }

  Event buildEvent({required Vaccine vaccine, required DateTime date, required DateTime dueDate, Recurrence? recurrence}) {
    return Event(
      title: '${vaccine.name} (Dose #${vaccine.dosesNumber}',
      description: 'You are due for your ${vaccine.name} on $dueDate',
      location: 'Growing Together',
      startDate: date,
      endDate: date,
      allDay: true,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 24*60),
      ),
      // androidParams: AndroidParams(
      //   emailInvites: ["test@example.com"],
      // ),
      recurrence: recurrence,
    );
  }

  Future<void> setReminders() async {
    try {
      User currentUser = await user;
      print(currentUser.uid);
      List<Vaccine> vaccines = await VaccineData.fetchVaccines();
      Map<String, DateTime?> dovs = await UserDBOps.fetchDOVs(currentUser);

      if (onlyMandatory) {
        vaccines.removeWhere((v) => !v.required);
      }
      print(vaccines.length);

      vaccines = [vaccines[0]];

      List<DateTime> dueDates = vaccines
          .map((v) => v.calculateDueDate(dob: currentUser.dob))
          .toList();

      for (int i = 0; i < vaccines.length; i++) {
        for (int j = 0; j < days.length; j++) {
          Event ev = buildEvent(
              vaccine: vaccines[i],
              date: dueDates[i].subtract(Duration(days: days[j])),
              dueDate: dueDates[i]);
          print(
              "${ev.title}, ${ev.allDay}, ${ev.startDate}, ${ev.description}");
          bool res = await Add2Calendar.addEvent2Cal(ev);
          if(res) {
            //TODO: Update User profile
          }
          else {
            throw  Exception("Action not completed");
          }
        }
      }

      setState(() {
        addingRems = false;
      });
    } catch(e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error, please try again later")));
    }
  }

  @override
  void initState() {
    user = UserDBOps.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // print(FirebaseAuth.instance.currentUser!.uid);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: user,
          builder: (_, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasData) {
                User user = snapshot.data!;
                print(addingRems);
                return Container(
                  height: MediaQuery.of(context).size.height*0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: MyColors.neutral1,
                        child: Container(width: 100, child: Image.asset("assets/images/logo.png", fit: BoxFit.fitWidth,)),
                        minRadius: 75,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("Username: "),
                                ),
                                Text(user.username,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("Email: "),
                                ),
                                Text(user.email,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("Child's Name: "),
                                ),
                                Text(user.childName,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("Date of Birth: "),
                                ),
                                Text(formatter.format(user.dob),style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          showDialog(context: _,
                              builder: (_) {
                                return EnableReminders(callback: selectRemindersCallback,);
                              },
                            barrierDismissible: false,
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith((states) {
                            if (user.remindersEnabled) {
                              return Colors.black54;
                            }
                            return MyColors.accent3;
                          }),
                        ),
                        child: addingRems? const CircularProgressIndicator() : Text(user.remindersEnabled ? "Reminders Enabled" : "Enable Reminders",),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          bool res = await UserDBOps.logout();
                          if(res) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Wrapper()), (route) => false);
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Logging Out, please try again later")));
                          }
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith((states) {
                            return Colors.redAccent;
                          }),
                        ),
                        child: const Text("Logout"),
                      ),
                    ],
                  ),
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
