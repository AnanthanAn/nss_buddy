import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nssbuddy/helpers/firestore_helper.dart';
import 'package:nssbuddy/widgets/event_card.dart';

class EventListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:FirestoreHelper().getEventPosts(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, idx) => EventCard(title: snapshot.data.documents[idx]['title'],),
          );
        });
  }
}
