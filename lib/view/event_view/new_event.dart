import 'package:divider/model/events.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'edit_event.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  TextEditingController _nameController = TextEditingController(),
      _dateController = TextEditingController(),
      _descController = TextEditingController();
  DateFormat _dateFormat = DateFormat('MMM d, yyyy');
  late DateTime dateTime;

  @override
  void initState() {
    // TODO: implement initState
    dateTime = DateTime.now();
    _dateController.text = _dateFormat.format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);
    final db = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(title: Text("Create New Event")),
      body: Stack(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            elevation: 4,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Title *',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.title_rounded),
                  ),
                  onEditingComplete: () => node.nextFocus(),
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  controller: _dateController,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2050),
                    ).then((dateSelected) {
                      if (dateSelected != null) {
                        dateTime = dateSelected;
                        _dateController.text = _dateFormat.format(dateSelected);
                        print("Selected Date: " + _dateController.text);
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Date *',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today_rounded),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description_rounded),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: 96,
              child: ElevatedButton(
                onPressed: () async {
                  var result = await db.collection('events').add({
                    'name': _nameController.text,
                    'description': _descController.text,
                    'date': Timestamp.fromDate(dateTime)
                  });

                  print(result);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditEvent(
                        events: Events(
                          _nameController.text,
                          _descController.text,
                          dateTime,
                        ),
                      ),
                    ),
                  );
                },
                child: Text("Create", style: TextStyle(fontSize: 24)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
