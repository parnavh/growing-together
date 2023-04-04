// import 'package:device_calendar/device_calendar.dart';
// import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:googleapis/calendar/v3.dart';
// import 'package:growing_together/ui_utils/colors.dart';
// // import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
// // import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// import '../boottom_nav/bottom_nav.dart';
// import '../vaccine_tracker/calendar.dart';
// import 'package:device_calendar/device_calendar.dart' as cal;
//
// class VaccinationTracker extends StatefulWidget {
//   final Function calendarCallback;
//   const VaccinationTracker({Key? key, required this.calendarCallback}) : super(key: key);
//
//   @override
//   State<VaccinationTracker> createState() => _VaccinationTrackerState();
// }
//
// class _VaccinationTrackerState extends State<VaccinationTracker> {
//   late DeviceCalendarPlugin _deviceCalendarPlugin;
//
//   late List<Calendar> _calendars;
//   late Calendar _selectedCalendar;
//
//
//   CalendarPageState() {
//     _deviceCalendarPlugin = new DeviceCalendarPlugin();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveCalendars();
//   }
//
//   void _retrieveCalendars() async {
//     //Retrieve user's calendars from mobile device
//     //Request permissions first if they haven't been granted
//     try {
//       var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
//       if (permissionsGranted.isSuccess && !permissionsGranted.data) {
//         permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
//         if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
//           return;
//         }
//       }
//
//       final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
//       print(calendarsResult.toString());
//       setState(() {
//         _calendars = calendarsResult.data;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Text('Select Calendar'),
//           ConstrainedBox(
//             constraints: BoxConstraints(maxHeight: 150.0),
//             child: ListView.builder(
//               itemCount: _calendars?.length ?? 0,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedCalendar = _calendars[index];
//                       this.widget.calendarCallback(_selectedCalendar.id, _selectedCalendar.name, _deviceCalendarPlugin);
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           flex: 1,
//                           child: Text(
//                             _calendars[index].name,
//                             style: TextStyle(fontSize: 25.0),
//                           ),
//                         ),
//                         Icon(_calendars[index].isReadOnly
//                             ? Icons.lock
//                             : Icons.lock_open, color: Colors.white,)
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// //
// // final GoogleSignIn _googleSignIn = GoogleSignIn(
// //   clientId:
// //   '361910762916-q63dpcvose5jldalgtvvhljt7opov40n.apps.googleusercontent.com', //App
// //   // '361910762916-si8jucdj1h90gnbmfo381i17ho6iukp2.apps.googleusercontent.com', //Web
// //   scopes: <String>[
// //     CalendarApi.CalendarScope,
// //   ],
// // );
//
// // Future<List<Event>> getGoogleEventsData() async {
// //   // print("signing in...");
// //   // final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
// //   // print(googleUser);
// //   // final GoogleAPIClient httpClient = GoogleAPIClient(await googleUser.authHeaders);
// //   // final httpClient = (await _googleSignIn.authenticatedClient())!;
// //   // final CalendarApi calendarAPI = CalendarApi(httpClient);
// //   final Events calEvents = await CalendarClient.calendar.events.list(
// //     "primary",
// //   );
// //   final List<Event> appointments = <Event>[];
// //   if (calEvents != null && calEvents.items != null) {
// //     for (int i = 0; i < calEvents.items.length; i++) {
// //       final Event event = calEvents.items[i];
// //       if (event.start == null) {
// //         continue;
// //       }
// //       appointments.add(event);
// //     }
// //   }
// //   return appointments;
// // }
//
// // build
// // return Scaffold(
// //   backgroundColor: MyColors.white1,
// //   body: Column(
// //     children: [
// //       Container(
// //         height: MediaQuery.of(context).size.height - 75,
// //         child: FutureBuilder(
// //           future: getGoogleEventsData(),
// //           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //             return Container(
// //               child: Stack(
// //                 children: [
// //                   Container(
// //                     child: SfCalendar(
// //                       view: CalendarView.month,
// //                       // dataSource: GoogleDataSource(events: snapshot.data),
// //                       monthViewSettings: MonthViewSettings(
// //                       appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
// //                       ),
// //                     ),
// //                   ),
// //                   snapshot.data != null
// //                   ? Container()
// //                   : Center(child: CircularProgressIndicator(),)
// //               ]),
// //             );
// //         }),
// //       ),
// //       const BottomNavBar(currInd: 1,),
// //     ],
// //   ),
// // );