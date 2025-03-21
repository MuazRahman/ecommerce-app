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
    apiKey: 'AIzaSyBmsYIt4b_XCjJltI2AXHfSccB8dI9HZkg',
    appId: '1:234249893195:web:72f9629d08a1707f2964ce',
    messagingSenderId: '234249893195',
    projectId: 'ecommerce-app-ff619',
    authDomain: 'ecommerce-app-ff619.firebaseapp.com',
    storageBucket: 'ecommerce-app-ff619.firebasestorage.app',
    measurementId: 'G-XHPSZB844J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5PXPanJF7yaxnSKPMbBnK3P0xgI0VNvQ',
    appId: '1:234249893195:android:e91f8be34160c3232964ce',
    messagingSenderId: '234249893195',
    projectId: 'ecommerce-app-ff619',
    storageBucket: 'ecommerce-app-ff619.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEoEOClDEZ-CWAf4FLjbpgv0rfuu4W-oI',
    appId: '1:234249893195:ios:dfaad76481d9efef2964ce',
    messagingSenderId: '234249893195',
    projectId: 'ecommerce-app-ff619',
    storageBucket: 'ecommerce-app-ff619.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEoEOClDEZ-CWAf4FLjbpgv0rfuu4W-oI',
    appId: '1:234249893195:ios:dfaad76481d9efef2964ce',
    messagingSenderId: '234249893195',
    projectId: 'ecommerce-app-ff619',
    storageBucket: 'ecommerce-app-ff619.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBmsYIt4b_XCjJltI2AXHfSccB8dI9HZkg',
    appId: '1:234249893195:web:c18b5a5473ac152b2964ce',
    messagingSenderId: '234249893195',
    projectId: 'ecommerce-app-ff619',
    authDomain: 'ecommerce-app-ff619.firebaseapp.com',
    storageBucket: 'ecommerce-app-ff619.firebasestorage.app',
    measurementId: 'G-FY1SV0GSSG',
  );
}
