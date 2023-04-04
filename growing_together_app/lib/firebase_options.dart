// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD-Y7aJWWeTKQUoFlO9PMRj_CFYLWdrnAU',
    appId: '1:833922589809:web:23bd8d640bb250ce9527d0',
    messagingSenderId: '833922589809',
    projectId: 'growing-together-93182',
    authDomain: 'growing-together-93182.firebaseapp.com',
    storageBucket: 'growing-together-93182.appspot.com',
    measurementId: 'G-B0VGDWK7L7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgTO2ex0eRvi4-PxOPdEMiM8oiTH7PbkU',
    appId: '1:833922589809:android:ee447f4cc94875f69527d0',
    messagingSenderId: '833922589809',
    projectId: 'growing-together-93182',
    storageBucket: 'growing-together-93182.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkl0G26pESn4_o-3IfQZQn67cwks2j5Mg',
    appId: '1:833922589809:ios:4074ddcf511a53679527d0',
    messagingSenderId: '833922589809',
    projectId: 'growing-together-93182',
    storageBucket: 'growing-together-93182.appspot.com',
    iosClientId: '833922589809-8tb3ntue4r0ihih147spq3718dossa42.apps.googleusercontent.com',
    iosBundleId: 'com.example.growingTogether',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkl0G26pESn4_o-3IfQZQn67cwks2j5Mg',
    appId: '1:833922589809:ios:4074ddcf511a53679527d0',
    messagingSenderId: '833922589809',
    projectId: 'growing-together-93182',
    storageBucket: 'growing-together-93182.appspot.com',
    iosClientId: '833922589809-8tb3ntue4r0ihih147spq3718dossa42.apps.googleusercontent.com',
    iosBundleId: 'com.example.growingTogether',
  );
}
