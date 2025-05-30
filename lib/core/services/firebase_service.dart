import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketinya/core/config/firebase_options.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  static FirebaseAuth get auth => FirebaseAuth.instance;

  static FirebaseFirestore get firestore => FirebaseFirestore.instance;
}