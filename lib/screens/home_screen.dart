import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssbuddy/screens/add_event_screen.dart';
import 'package:nssbuddy/widgets/drawer.dart';
import 'package:nssbuddy/widgets/event_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NSS Buddy',
          style: GoogleFonts.kanit(),
        ),
      ),
      drawer: HamDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(child: EventListView()),
        ],
      ),floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, AddNewEventScreen.routeName);
    }),
    );
  }
}
