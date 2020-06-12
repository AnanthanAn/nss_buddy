import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewEventScreen extends StatefulWidget {
  static const String routeName = '/addNewEvent';
  @override
  _AddNewEventScreenState createState() => _AddNewEventScreenState();
}

class _AddNewEventScreenState extends State<AddNewEventScreen> {
  var _formKey = UniqueKey();
  var selectedDate = DateFormat.yMMMd().format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new event'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(selectedDate,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(textColor: Colors.lightBlue,
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
              ],
            ),
          )),
    );
  }
}
