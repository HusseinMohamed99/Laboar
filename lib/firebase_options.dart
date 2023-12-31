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
    apiKey: 'AIzaSyCYtmTKFHqUYPwu2XG0z5w-nNKmi8QJ5Ts',
    appId: '1:258114059275:web:84db27db098c3d8b061b0e',
    messagingSenderId: '258114059275',
    projectId: 'laboar-9d77d',
    authDomain: 'laboar-9d77d.firebaseapp.com',
    storageBucket: 'laboar-9d77d.appspot.com',
    measurementId: 'G-34630PN3RH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnkGDyPfcVwJL7UdL7HdqBHFdSdOmX4LQ',
    appId: '1:258114059275:android:6a051b8bffe93806061b0e',
    messagingSenderId: '258114059275',
    projectId: 'laboar-9d77d',
    storageBucket: 'laboar-9d77d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpBcVE4-uuqkEVVT56yQJuUwa1K9SQOSs',
    appId: '1:258114059275:ios:a520e0ff391e85c1061b0e',
    messagingSenderId: '258114059275',
    projectId: 'laboar-9d77d',
    storageBucket: 'laboar-9d77d.appspot.com',
    iosClientId: '258114059275-86knq4qr96b154jr5ld49n8uu8b8noou.apps.googleusercontent.com',
    iosBundleId: 'com.example.laboar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpBcVE4-uuqkEVVT56yQJuUwa1K9SQOSs',
    appId: '1:258114059275:ios:08941462ddf1d766061b0e',
    messagingSenderId: '258114059275',
    projectId: 'laboar-9d77d',
    storageBucket: 'laboar-9d77d.appspot.com',
    iosClientId: '258114059275-c7hnuj4m5r0ia98lcim71od1jsngd30s.apps.googleusercontent.com',
    iosBundleId: 'com.example.laboar.RunnerTests',
  );
}
