import 'package:flutter/material.dart';
import 'package:nssbuddy/screens/add_event_screen.dart';
import 'package:nssbuddy/screens/home_screen.dart';
import 'package:nssbuddy/screens/knowyournss_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: HomeScreen(),
      routes: {
        KnowYourNssScreen.routeName: (context) => KnowYourNssScreen(),
        AddNewEventScreen.routeName: (context) => AddNewEventScreen(),
      },
    );
  }
}
