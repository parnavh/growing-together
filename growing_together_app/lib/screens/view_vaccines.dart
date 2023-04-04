// import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:growing_together/ui_utils/colors.dart';
import 'package:growing_together/user/user.dart';
import 'package:growing_together/user/user_dbops.dart';
import 'package:growing_together/vaccine_tracker/vaccine_card.dart';
import 'package:growing_together/vaccine_tracker/vaccine_data.dart';
import 'package:growing_together/vaccine_tracker/vaccines.dart';

class ViewVaccinesPage extends StatefulWidget {
  const ViewVaccinesPage({Key? key}) : super(key: key);

  @override
  State<ViewVaccinesPage> createState() => _ViewVaccinesPageState();
}

class _ViewVaccinesPageState extends State<ViewVaccinesPage> {

  // final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late List<Vaccine> vaccines;
  late User currentUser;
  late Map<String, DateTime?> dovs;
  late int vaccCount;
  // late List<List<int>> vaccDoesNos;
  late int manVaccCount;
  bool isFiltered = false;
  late List<Vaccine> filteredVaccines;
  bool isSorted = false;
  List<Vaccine>? sortedVaccines;

  Event buildEvent({required Vaccine vaccine, required DateTime date, required DateTime dueDate, Recurrence? recurrence}) {
    return Event(
      title: '${vaccine.name} (Dose #${vaccine.dosesNumber}',
      description: 'You are due for your ${vaccine.name} on $dueDate',
      location: 'Growing Together',
      startDate: date,
      endDate: date,
      allDay: true,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
      ),
      // androidParams: AndroidParams(
      //   emailInvites: ["test@example.com"],
      // ),
      recurrence: recurrence,
    );
  }

  Future<bool>_initialise() async {
    try {
      vaccines = await VaccineData.fetchVaccines();
      currentUser = await UserDBOps.getCurrentUser();
      dovs = await UserDBOps.fetchDOVs(currentUser);
      filteredVaccines = getFilteredList();

      var res = getCount();
      vaccCount = res.key;
      manVaccCount = res.value;
      // vaccCount = res.key.key;
      // manVaccCount = res.key.value;
      // vaccDoesNos = res.value;

      return true;

    } catch(E) {
      print(E);
      return false;
    }
  }

  List<DateTime> getDueDates(List<Vaccine> copy) {
    List<DateTime> dueDates = copy.map((v) => v.calculateDueDate(dob: currentUser.dob)).toList();
    return dueDates;
  }

  List<Vaccine> getFilteredList() {
    List<Vaccine> copy = List.from(vaccines);
    copy.removeWhere((element) => !element.required);
    return copy;
  }

  // List<Vaccine> getSortedList(List<Vaccine> copy) {
  //   List<DateTime> dueDates = getDueDates(copy);
  //
  //   final Map<String, int> mapping = {
  //     for (int i = 0; i < copy.length; i++)
  //       letters[i]: numbers[i]
  //   };
  //
  //   letters.sort((a, b) => b.compareTo(a));
  //
  //   numbers = [
  //     for (String letter in letters) mapping[letter]
  //   ];
  //
  //   return copy;
  // }

  // MapEntry<MapEntry<int, int>, List<List<int>>> getCount() {
  MapEntry<int, int> getCount() {
    // List<List<int>> doses = [];
    // int count = 0;
    // int manCount = 0;
    // for (int i=0; i<vaccines.length; i++) {
    //   count += vaccines[i].doses;
    //   if(vaccines[i].required) manCount += vaccines[i].doses;
    //
    //   for(int j=0; j<vaccines[i].doses; j++) {
    //     doses += [[i, j]];
    //   }
    // }
    // print(doses);
    // return MapEntry(MapEntry(count, manCount), doses);
    int count = vaccines.length;
    int manCount = 0;
    for (int i=0; i<vaccines.length; i++) {
      if(vaccines[i].required) manCount += 1;
    }
    return MapEntry(count, manCount);
  }

  Future<void> updateDOV(String vaccId, DateTime dov) async {
    String msg = "Error, please pick a date";

    if(dov.isAfter(DateTime.now())) {
      msg = "Error, please pick a valid date";
    }
    else {
      bool res = await UserDBOps.setDOV(currentUser.uid, dovs, dov, vaccId);
      if(res) {
        setState(() {});
      }
      else {
        msg = "Error, please try again later";
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),behavior: SnackBarBehavior.floating,));
  }

  @override
  Widget build(BuildContext context) {

    // return Center(
    //   child: OutlinedButton(
    //     onPressed: () async {
    //       bool res = await VaccineData.uploadVaccines(demo);
    //       debugPrint(res.toString());
    //     },
    //     child: Text("Upload Vaccines"),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text("Vaccines", style: TextStyle(fontSize: 24),),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // OutlinedButton(
                        //   child: Text("Manage Reminders"),
                        //   onPressed: () {},
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(Icons.filter_list_alt, color: isFiltered ? MyColors.accent3 : Colors.black54,),
                            onTap: () {
                              setState(() {
                                isFiltered = !isFiltered;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(Icons.sort, color: isSorted ? MyColors.accent3 : Colors.black54,),
                            onTap: () {
                              setState(() {
                                isSorted = !isSorted;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height-178,
              child: FutureBuilder(
                future: _initialise(),
                builder: (_, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    if(snapshot.data!){
                      List<DateTime> dueDates = getDueDates(isFiltered ? filteredVaccines : vaccines);
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: isFiltered ? manVaccCount : vaccCount,
                        itemBuilder: (_, i) {
                          // Vaccine v = vaccines[vaccDoesNos[i][0]];
                          // DateTime dueDate = v.calculateDueDate(doseNumber: vaccDoesNos[i][1], dob: currentUser.dob);
                          Vaccine v = isFiltered ? filteredVaccines[i] : vaccines[i];
                          // DateTime dueDate = v.calculateDueDate(doseNumber: vaccDoesNos[i][1], dob: currentUser.dob);
                          // DateTime dueDate = v.calculateDueDate(dob: currentUser.dob);
                          bool rec = dovs[v.uid] == null ? false : true;
                          VaccinationStatus status = v.getStatus(rec, dueDates[i]);
                          return VaccineCard(
                            vaccine: v,
                            // doseNumber: vaccDoesNos[i][1]+1,
                            doseNumber: v.dosesNumber,
                            dueDate: dueDates[i],
                            status: status,
                            updateDOVCallback: updateDOV,
                          );
                        },
                      );
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Add event to calendar example'),
    //     ),
    //     body: ListView(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ListTile(
    //           title: Text('Add normal event'),
    //           trailing: Icon(Icons.calendar_today),
    //           onTap: () {
    //             Add2Calendar.addEvent2Cal(
    //               buildEvent(),
    //             );
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           title: const Text('Add event with recurrence 1'),
    //           subtitle: const Text("weekly for 3 months"),
    //           trailing: Icon(Icons.calendar_today),
    //           onTap: () {
    //             Add2Calendar.addEvent2Cal(buildEvent(
    //               recurrence: Recurrence(
    //                 frequency: Frequency.weekly,
    //                 endDate: DateTime.now().add(Duration(days: 60)),
    //               ),
    //             ));
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           title: const Text('Add event with recurrence 2'),
    //           subtitle: const Text("every 2 months for 6 times (1 year)"),
    //           trailing: Icon(Icons.calendar_today),
    //           onTap: () {
    //             Add2Calendar.addEvent2Cal(buildEvent(
    //               recurrence: Recurrence(
    //                 frequency: Frequency.monthly,
    //                 interval: 2,
    //                 ocurrences: 6,
    //               ),
    //             ));
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           title: const Text('Add event with recurrence 3'),
    //           subtitle:
    //           const Text("RRULE (android only) every year for 10 years"),
    //           trailing: Icon(Icons.calendar_today),
    //           onTap: () {
    //             Add2Calendar.addEvent2Cal(buildEvent(
    //               recurrence: Recurrence(
    //                 frequency: Frequency.yearly,
    //                 rRule: 'FREQ=YEARLY;COUNT=10;WKST=SU',
    //               ),
    //             ));
    //           },
    //         ),
    //         Divider(),
    //       ],
    //     ),
    // );
  }

  // //Calendar Variables
  // bool deleted = false;
  // bool calendarSelected = false;
  // String calendarButtonText = 'Select Calendar to Add Events';
  // String _currentCalendarID = '';
  // DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();
  //
  // void _setCalendarCallback(
  //     String calendarID, String calendarName, DeviceCalendarPlugin deviceCal) {
  //   //Calendar Callback Function used by Calendar Page
  //   //Calendar Page will call the callback to provide calendar info needed
  //   //to load mma events into calendar
  //   setState(() {
  //     _currentCalendarID = calendarID;
  //     calendarButtonText = calendarName;
  //     _deviceCalendarPlugin = deviceCal;
  //     calendarSelected = false;
  //   });
  // }
  //
  // Widget calendarButtonOrCalendar() {
  //   //Returns a calendar button that displays 'Select Calendar' or Returns a
  //   // Calendar Page if the button was pressed
  //   if (!calendarSelected) {
  //     return OutlinedButton(
  //         child: Row(
  //           children: [
  //             Icon(
  //               Icons.calendar_today,
  //               color: Colors.amber[600],
  //             ),
  //             Text(calendarButtonText,),
  //                 // style: Theme.of(context).textTheme.body1),
  //           ],
  //         ),
  //         onPressed: () {
  //           setState(() {
  //             calendarSelected = true;
  //           });
  //         });
  //   } else {
  //     return VaccinationTracker(calendarCallback: this._setCalendarCallback,);
  //   }
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       // Here we take the value from the MyHomePage object that was created by
  //       // the App.build method, and use it to set our appbar title.
  //       // title: new Image.asset('assets/Logo.png'),
  //     ),
  //     body: Center(
  //       // Center is a layout widget. It takes a single child and positions it
  //       // in the middle of the parent.
  //       child: Column(
  //         // Column is also layout widget. It takes a list of children and
  //         // arranges them vertically. By default, it sizes itself to fit its
  //         // children horizontally, and tries to be as tall as its parent.
  //         //
  //         // Invoke "debug painting" (press "p" in the console, choose the
  //         // "Toggle Debug Paint" action from the Flutter Inspector in Android
  //         // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
  //         // to see the wireframe for each widget.
  //         //
  //         // Column has various properties to control how it sizes itself and
  //         // how it positions its children. Here we use mainAxisAlignment to
  //         // center the children vertically; the main axis here is the vertical
  //         // axis because Columns are vertical (the cross axis would be
  //         // horizontal).
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: <Widget>[
  //           // Column(
  //           //   mainAxisAlignment: MainAxisAlignment.center,
  //           //   children: <Widget>[
  //           //     CheckboxListTile(
  //           //         value: queryUFC,
  //           //         title:
  //           //         Text('UFC', style: Theme.of(context).textTheme.body1),
  //           //         onChanged: _toggleQueryUFC),
  //           //     CheckboxListTile(
  //           //         value: queryBellator,
  //           //         title: Text('Bellator',
  //           //             style: Theme.of(context).textTheme.body1),
  //           //         onChanged: _toggleQueryBellator),
  //           //     CheckboxListTile(
  //           //         value: queryOneFC,
  //           //         title: Text('One FC',
  //           //             style: Theme.of(context).textTheme.body1),
  //           //         onChanged: _toggleQueryOneFC),
  //           //   ],
  //           // ),
  //           new Expanded(child: calendarButtonOrCalendar()),
  //           // loadFightsButton(),
  //           // deleteFightsButton(),
  //           // statusMessageHeader(),
  //           new Expanded(
  //             child: SingleChildScrollView(
  //               child: Text(
  //                 "statusString",
  //                 // style: Theme.of(context).textTheme.body1,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
