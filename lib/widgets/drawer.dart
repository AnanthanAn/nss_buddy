import 'package:flutter/material.dart';
import 'package:nssbuddy/screens/knowyournss_screen.dart';

class HamDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Container(width: double.infinity, child: Text('NSS Buddy',style: TextStyle(fontSize: 26),)),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.today),
            ),
            title: Text('Upcoming Events'),
            onTap: () {},
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.group),
            ),
            title: Text('Know your NSS'),
            onTap: () {
              Navigator.pushNamed(context, KnowYourNssScreen.routeName);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.photo_library),
            ),
            title: Text('Galllery'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
