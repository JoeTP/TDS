import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'modules/login.sc.dart';
import 'mqtt.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }



  @override
  Widget build(BuildContext context) {
    m1();
    m2();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme:
        BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
        ),
      ),
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginSc();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: initializeFirebase(),
      ),
    );
  }
}

// فاضل نعمل شاشة لوج إن و نربطها بالداتا بيز عشان تسجيل الدخول
// شاشة اللوج إن جاهزة
// الكاميرا
