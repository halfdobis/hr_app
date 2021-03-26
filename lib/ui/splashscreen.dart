import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 4;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    loadWidget();
  }

  loadWidget() async {
    var duration = Duration(seconds: splashDelay);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).popAndPushNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PlayAnimation<double>(
          duration: Duration(seconds: 2),
          tween: Tween<double>(begin: .1, end: 1),
          builder: (context, child, value) {
            var width = MediaQuery.of(context).size.width;
            return Container(
              width: width * value,
              child: Image.asset('assets/images/lapo-logo.png'),
            );
          },
        ),
      ),
    );
  }
}
