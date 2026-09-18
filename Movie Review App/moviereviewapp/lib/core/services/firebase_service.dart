import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

// Uncomment this after running `flutterfire configure`
// import '../../firebase_options.dart';

class FirebaseService {
  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        // Uncomment this after running `flutterfire configure`
        // options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      debugPrint("Firebase initialization failed: $e");
    }
  }
}
