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
    apiKey: 'AIzaSyBHV7LUF5ay7-49rgIlmZFot0VXFBAsNSE',
    appId: '1:514983515459:web:4ffccccd2e938065e48bf6',
    messagingSenderId: '514983515459',
    projectId: 'credaqui2-f9925',
    authDomain: 'credaqui2-f9925.firebaseapp.com',
    storageBucket: 'credaqui2-f9925.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcy0oA1c1gFPU2EmfT07soUA5FgEGpMas',
    appId: '1:514983515459:android:c887273304cd9812e48bf6',
    messagingSenderId: '514983515459',
    projectId: 'credaqui2-f9925',
    storageBucket: 'credaqui2-f9925.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATSGEN6u1c6v3Sg9DuOvmkMc88KENUv0o',
    appId: '1:514983515459:ios:de4227d3ade7b83ce48bf6',
    messagingSenderId: '514983515459',
    projectId: 'credaqui2-f9925',
    storageBucket: 'credaqui2-f9925.appspot.com',
    iosBundleId: 'com.example.untitled2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATSGEN6u1c6v3Sg9DuOvmkMc88KENUv0o',
    appId: '1:514983515459:ios:c0a6558757a69c2ce48bf6',
    messagingSenderId: '514983515459',
    projectId: 'credaqui2-f9925',
    storageBucket: 'credaqui2-f9925.appspot.com',
    iosBundleId: 'com.example.untitled2.RunnerTests',
  );
}