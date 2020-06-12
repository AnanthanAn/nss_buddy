import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;

  EventCard({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                'https://images.unsplash.com/photo-1591040092219-081fb773589c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 26),
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.place),
                        Text('Kayamkulam'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.date_range),
                        Text('10 Jun 2020'),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
