import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imageUrl;

  EventCard(
      {@required this.title,
      @required this.location,
      @required this.date,
      this.imageUrl});

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
                imageUrl,
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
                        Text(location),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.date_range),
                        Text(date),
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
