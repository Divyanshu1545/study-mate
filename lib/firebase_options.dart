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
    apiKey: 'AIzaSyCDsDpab6oqND1NNE-CQ_E4Zp5YXWPjWpk',
    appId: '1:573912425768:web:578b61eaabe1089919dc1d',
    messagingSenderId: '573912425768',
    projectId: 'study-buddy-fed3e',
    authDomain: 'study-buddy-fed3e.firebaseapp.com',
    storageBucket: 'study-buddy-fed3e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3_p11kRWddvFWtNJlRROzZRomJI_c-PU',
    appId: '1:573912425768:android:50ce146d7d04aaec19dc1d',
    messagingSenderId: '573912425768',
    projectId: 'study-buddy-fed3e',
    storageBucket: 'study-buddy-fed3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPW4x6x476OZLcTxH4_KXVO30pmdtmZiw',
    appId: '1:573912425768:ios:524c81e3f112d65519dc1d',
    messagingSenderId: '573912425768',
    projectId: 'study-buddy-fed3e',
    storageBucket: 'study-buddy-fed3e.appspot.com',
    iosBundleId: 'com.example.studyBuddy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPW4x6x476OZLcTxH4_KXVO30pmdtmZiw',
    appId: '1:573912425768:ios:9fd2ed57d1edb3a519dc1d',
    messagingSenderId: '573912425768',
    projectId: 'study-buddy-fed3e',
    storageBucket: 'study-buddy-fed3e.appspot.com',
    iosBundleId: 'com.example.studyBuddy.RunnerTests',
  );
}
