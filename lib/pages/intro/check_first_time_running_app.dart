import 'package:flutter/material.dart';
import 'package:headaky/pages/home_page.dart';
import 'package:headaky/pages/intro/intro_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckFirstRunningApp extends StatefulWidget {
  @override
  _CheckFirstRunningAppState createState() => _CheckFirstRunningAppState();
}

class _CheckFirstRunningAppState extends State<CheckFirstRunningApp> {
  Future checkFirstRunning() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkFirstRunning();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
