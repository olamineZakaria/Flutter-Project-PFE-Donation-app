import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'components/colors.dart';
import 'components/common/string.dart';
import 'components/forget_password_page.dart';

int currentIndex = 0;

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 300),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20, top: 0),
            child: GestureDetector(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  )),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: 'assets/images/donation.jpeg',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  reverse: true,
                  image: 'assets/images/p1.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: 'assets/images/help.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }
}

Widget makePage({image, title, content, reverse = false}) {
  return Container(
    padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        !reverse
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(image),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            : SizedBox(),
        Text(
          title,
          style: TextStyle(
              color: Colorme.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colorme.gray, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        reverse
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(image),
                  ),
                ],
              )
            : SizedBox(),
      ],
    ),
  );
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    height: 6,
    width: isActive ? 30 : 6,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
        color: Colorme.ska, borderRadius: BorderRadius.circular(5)),
  );
}

List<Widget> _buildIndicator() {
  List<Widget> indicators = [];
  for (int i = 0; i < 3; i++) {
    if (currentIndex == i) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }

  return indicators;
}
