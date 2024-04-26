// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD8zaKMFJkenmPl6vO71HQNqL-5K1q0XeM',
    appId: '1:482618191183:web:966ff1db8b62c7ed4da93a',
    messagingSenderId: '482618191183',
    projectId: 'bmi-calculator35',
    authDomain: 'bmi-calculator35.firebaseapp.com',
    storageBucket: 'bmi-calculator35.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcBAecsdbaGeMXnV_NteBFH3O3M5V_kzk',
    appId: '1:482618191183:android:5983e164fdec81294da93a',
    messagingSenderId: '482618191183',
    projectId: 'bmi-calculator35',
    storageBucket: 'bmi-calculator35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAj5NdFI7vVbZ1vAzrK3PeyEgcrus_s4GQ',
    appId: '1:482618191183:ios:fe07ffa6859549c74da93a',
    messagingSenderId: '482618191183',
    projectId: 'bmi-calculator35',
    storageBucket: 'bmi-calculator35.appspot.com',
    iosBundleId: 'com.example.bmiCalculator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAj5NdFI7vVbZ1vAzrK3PeyEgcrus_s4GQ',
    appId: '1:482618191183:ios:fe07ffa6859549c74da93a',
    messagingSenderId: '482618191183',
    projectId: 'bmi-calculator35',
    storageBucket: 'bmi-calculator35.appspot.com',
    iosBundleId: 'com.example.bmiCalculator',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD8zaKMFJkenmPl6vO71HQNqL-5K1q0XeM',
    appId: '1:482618191183:web:f7561abbb2a247e24da93a',
    messagingSenderId: '482618191183',
    projectId: 'bmi-calculator35',
    authDomain: 'bmi-calculator35.firebaseapp.com',
    storageBucket: 'bmi-calculator35.appspot.com',
  );
}
