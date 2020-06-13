import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nssbuddy/helpers/firestore_helper.dart';

class AddNewEventScreen extends StatefulWidget {
  static const String routeName = '/addNewEvent';
  @override
  _AddNewEventScreenState createState() => _AddNewEventScreenState();
}

class _AddNewEventScreenState extends State<AddNewEventScreen> {
  var _formKey = GlobalKey<FormState>();
  var selectedDate = DateFormat.yMMMd().format(DateTime.now()).toString();
  File _image;
  var title = '';
  var description = '';
  var location = '';
  var date = DateTime.now();
  var _isLoading = false;

  Future<void> getImage() async {
    // pick image from gallery
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery,imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future<void> _saveForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState.save();
    await FirestoreHelper.addEventPost(
        title, description, location, selectedDate, _image);
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new event'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      onSaved: (val) => title = val,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Description'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (val) => description = val,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Location'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                      onSaved: (val) => location = val,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          selectedDate,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FlatButton(
                          textColor: Colors.lightBlue,
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now().toLocal(),
                                    firstDate: DateTime.utc(2019),
                                    lastDate: DateTime.now())
                                .then((value) {
                              setState(() {
                                selectedDate =
                                    DateFormat.yMMMd().format(value).toString();
                              });
                            });
                          },
                          child: Text(
                            'Select Date',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: _image == null
                              ? Text('Choose an Image.')
                              : Image.file(_image),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.lightBlue)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          textColor: Colors.lightBlue,
                          child: Text('Choose Image'),
                          onPressed: getImage,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.lightBlue,
                              child: Text('Save'),
                              onPressed: _saveForm),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
