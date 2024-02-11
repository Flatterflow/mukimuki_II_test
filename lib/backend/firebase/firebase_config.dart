import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDa1C_d39Qdu5yfo-ZmO_ZOOJ5k7zMPI6A",
            authDomain: "muki-muki-649c6.firebaseapp.com",
            projectId: "muki-muki-649c6",
            storageBucket: "muki-muki-649c6.appspot.com",
            messagingSenderId: "875508631575",
            appId: "1:875508631575:web:cdecbcac0227f8a4f7b452"));
  } else {
    await Firebase.initializeApp();
  }
}
