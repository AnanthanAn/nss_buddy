import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: <Widget>[
          Text('Upcoming Events'),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            color: Colors.greenAccent,
            child: Container(height: 100,width: double.infinity,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(fontSize: 26),textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
