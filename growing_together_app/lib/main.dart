import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:growing_together/auth/login_state.dart';
import 'package:growing_together/screens/home_page.dart';
import 'package:growing_together/screens/wrapper.dart';
import 'package:growing_together/ui_utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'firebase_options.dart';
import 'package:growing_together/vaccine_tracker/secrets.dart'as MySecret;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // var _clientID = new ClientId(MySecret.Secret.getId(), "");
  // const _scopes = const [cal.CalendarApi.CalendarScope];
  // await clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) async {
  //   CalendarClient.calendar = cal.CalendarApi(client);
  // });
  runApp(const MyApp());
}

void prompt(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Growing Together',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginState loginState = LoginState();

  Future<bool> setScreen() async {
    print("here1");
    bool res = await loginState.initialse();
    if (res) {
      print("here2");
      return await loginState.isLoggedIn();
    } else {
      print("here3");
      // throw Exception('Error reading user info, please try again');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrapper(),
    );
    // return Scaffold(
    //   body: FutureBuilder(
    //       future: setScreen(),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.done) {
    //           //TODO: Add login state check
    //           return Home();
    //         } else {
    //           return Container(
    //             color: MyColors.accent3,
    //             height: 100,
    //             width: 100,
    //           );
    //         }
    //       }),
    // );
  }
}
