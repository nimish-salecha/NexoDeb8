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
    apiKey: 'AIzaSyAvE5vHVjdjeWrmPX5GCmZ4Z6yUosK9D_w',
    appId: '1:179804533123:web:8fbbe5390230ad98c4c6b6',
    messagingSenderId: '179804533123',
    projectId: 'gptt-6ae89',
    authDomain: 'gptt-6ae89.firebaseapp.com',
    storageBucket: 'gptt-6ae89.appspot.com',
    measurementId: 'G-9VYGYRXL6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWBXLAvkAao5zAHsuRd8f0jYZ21WcQSH8',
    appId: '1:179804533123:android:7817d05436f5df33c4c6b6',
    messagingSenderId: '179804533123',
    projectId: 'gptt-6ae89',
    storageBucket: 'gptt-6ae89.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbYKBbZvbKyb1HM0xuXVHLFntLR2D6gaU',
    appId: '1:179804533123:ios:b1f31e96c9281223c4c6b6',
    messagingSenderId: '179804533123',
    projectId: 'gptt-6ae89',
    storageBucket: 'gptt-6ae89.appspot.com',
    iosBundleId: 'com.example.gpt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbYKBbZvbKyb1HM0xuXVHLFntLR2D6gaU',
    appId: '1:179804533123:ios:71a31612b20260b3c4c6b6',
    messagingSenderId: '179804533123',
    projectId: 'gptt-6ae89',
    storageBucket: 'gptt-6ae89.appspot.com',
    iosBundleId: 'com.example.gpt.RunnerTests',
  );
}
