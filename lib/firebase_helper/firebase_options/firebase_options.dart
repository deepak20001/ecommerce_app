import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    // if(Platform.isAndroid) {
    return const FirebaseOptions(
      appId: '1:119026046437:android:8c8069f88cae527e1bcb0c',
      apiKey: 'AIzaSyB8xkfmIdxajbIHe7QN4YojcASg1JMoO3A',
      projectId: 'e-commerce-app-8a3c5',
      messagingSenderId: '119026046437',
    );
    // }
  }
}
