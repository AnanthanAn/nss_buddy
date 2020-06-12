import 'package:flutter/material.dart';

class KnowYourNssScreen extends StatelessWidget {
  static const routeName = '/knowyournss';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know Your NSS'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Image.network(
                  'https://png.pngtree.com/png-clipart/20190520/original/pngtree-vector-users-icon-png-image_4144740.jpg',fit: BoxFit.cover,),
            ),
            title: Text('Cristiano Ronaldo'),subtitle: Text('Student Leader'),
          ),ListTile(
            leading: CircleAvatar(
              child: Image.network(
                  'https://png.pngtree.com/png-clipart/20190520/original/pngtree-vector-users-icon-png-image_4144740.jpg'),
            ),
            title: Text('Leo Messi'),subtitle: Text('Student volunteer'),
          ),ListTile(
            leading: CircleAvatar(
              child: Image.network(
                  'https://png.pngtree.com/png-clipart/20190520/original/pngtree-vector-users-icon-png-image_4144740.jpg'),
            ),
            title: Text('Jaden Sancho'),subtitle: Text('Student volunteer'),
          ),ListTile(
            leading: CircleAvatar(
              child: Image.network(
                  'https://png.pngtree.com/png-clipart/20190520/original/pngtree-vector-users-icon-png-image_4144740.jpg'),
            ),
            title: Text('Eden Hazard'),subtitle: Text('Student volunteer'),
          ),
        ],
      ),
    );
  }
}
