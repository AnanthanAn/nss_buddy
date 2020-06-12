

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper{


  Future<QuerySnapshot> getEventPosts() async{
    var firebase = Firestore.instance.collection('posts');
    return firebase.getDocuments();

  }





}