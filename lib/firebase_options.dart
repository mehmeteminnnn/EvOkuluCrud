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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC9uQ_22UXiPWS9rYngvg-CaLah_iiaPRc',
    appId: '1:1041416472984:web:b3a1b8148800ff604343ed',
    messagingSenderId: '1041416472984',
    projectId: 'ev-okulu-577e8',
    authDomain: 'ev-okulu-577e8.firebaseapp.com',
    storageBucket: 'ev-okulu-577e8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIpABlDDfW3UT6HDCQgoXlKqYw-DDLAHo',
    appId: '1:1041416472984:android:1f760bdc6b4b50d74343ed',
    messagingSenderId: '1041416472984',
    projectId: 'ev-okulu-577e8',
    storageBucket: 'ev-okulu-577e8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATCRQrjKLsgus7gKejMe3aIkfJPbPJNag',
    appId: '1:1041416472984:ios:6cd45bcca1c4b23b4343ed',
    messagingSenderId: '1041416472984',
    projectId: 'ev-okulu-577e8',
    storageBucket: 'ev-okulu-577e8.appspot.com',
    iosBundleId: 'com.example.projee',
  );
}
