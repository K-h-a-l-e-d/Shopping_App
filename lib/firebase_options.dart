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
    apiKey: 'AIzaSyCj0FB25-9N8o8BUjrnBDBSydWw1G6_3Bs',
    appId: '1:515127270500:web:a2ca555db4ee9cb7c05371',
    messagingSenderId: '515127270500',
    projectId: 'flutterproject-3256a',
    authDomain: 'flutterproject-3256a.firebaseapp.com',
    storageBucket: 'flutterproject-3256a.firebasestorage.app',
    measurementId: 'G-EK34HE77KR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC80sNymVlweGx9TSimyElJRtTXJBf-eDc',
    appId: '1:1069378718384:android:fa538c5207e45b74740975',
    messagingSenderId: '1069378718384',
    projectId: 'shoppingapp-37a61',
    storageBucket: 'shoppingapp-37a61.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGY9pz6cUFab_D_UwGwQetb4sYLSJD2d8',
    appId: '1:515127270500:ios:f8f6782ea2cbe5e7c05371',
    messagingSenderId: '515127270500',
    projectId: 'flutterproject-3256a',
    storageBucket: 'flutterproject-3256a.firebasestorage.app',
    iosBundleId: 'com.example.shoppingAppUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGY9pz6cUFab_D_UwGwQetb4sYLSJD2d8',
    appId: '1:515127270500:ios:f8f6782ea2cbe5e7c05371',
    messagingSenderId: '515127270500',
    projectId: 'flutterproject-3256a',
    storageBucket: 'flutterproject-3256a.firebasestorage.app',
    iosBundleId: 'com.example.shoppingAppUi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBW2RDr3n74ChGZYv31ib735eHh7c53Smk',
    appId: '1:1069378718384:web:f44b34d27c01e5c4740975',
    messagingSenderId: '1069378718384',
    projectId: 'shoppingapp-37a61',
    authDomain: 'shoppingapp-37a61.firebaseapp.com',
    storageBucket: 'shoppingapp-37a61.firebasestorage.app',
    measurementId: 'G-6KWDVEJREK',
  );

}