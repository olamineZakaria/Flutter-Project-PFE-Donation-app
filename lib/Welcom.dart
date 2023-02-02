import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_signup/components/login_page.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Center(
            child: Container(
                child: Image(image: AssetImage('assets/images/donation.jpeg'))),
          )
        ],
      ),
    );
  }
}
