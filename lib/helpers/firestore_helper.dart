import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper {
  static Future<QuerySnapshot> getEventPosts() async {
    var firebase = Firestore.instance.collection('posts');
    return firebase.getDocuments();
  }

  static Future<dynamic> uploadImage(File imageFile,String id) async {
    //upload image to Cloud storage and return the link
    FirebaseStorage _storage = FirebaseStorage.instance;
    final reference = _storage.ref().child(id);
    await reference.putFile(imageFile).onComplete;
    var url = await reference.getDownloadURL();
    return url;
  }

  static Future addEventPost(String title, String description, String location,
      String dateTime, File image) async {
    var firebase = Firestore.instance.collection('posts');
    var docID = DateTime.now().toString();
    var imageUrl = await uploadImage(image,docID);
    await firebase.document(docID).setData({
      'title': title,
      'desc': description,
      'location': location,
      'date': dateTime,
      'imageUrl': imageUrl
    });
  }
}
