import 'package:flutter/material.dart';
import 'package:headaky/pages/feels_list_page.dart';
import 'package:headaky/pages/intro/check_first_time_running_app.dart';

import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Bahnschrift',
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: IntroScreen(),
      home: CheckFirstRunningApp(),
      routes: <String, WidgetBuilder>{
        '/app': (BuildContext context) => HomePage(),
        '/feels': (BuildContext context) => FeelsListPage(),
      },
    );
  }
}
