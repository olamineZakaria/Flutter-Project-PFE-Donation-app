import 'package:flutter/material.dart';
import 'package:login_signup/Welcom.dart';
import 'package:login_signup/components/login_page.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     // ignore: prefer_const_constructors
  //     options: FirebaseOptions(
  //         apiKey: "AIzaSyAeWxc-rOUTgnTy7_o0oTyo4hvZlZLTgBg",
  //         projectId: "web-donation-66a54",
  //         messagingSenderId: "1087171310226",
  //         appId: "1:1087171310226:web:623eb750cd248fbb026c4b"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
