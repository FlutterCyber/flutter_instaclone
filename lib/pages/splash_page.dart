import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static final String id = 'splash_page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  initTimer() {
    Timer(Duration(seconds: 2), () {
      _callSignInPage();
    });
  }

  _callSignInPage() {
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(193, 53, 132, 1),
            Color.fromRGBO(131, 58, 180, 1),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Expanded(
            child: Center(
              child: Text(
                "Instagram",
                style: TextStyle(
                    color: Colors.white, fontSize: 45, fontFamily: 'Billabong'),
              ),
            ),
          ),
          Text(
            'All rights reserved',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ));
  }
}
