import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:divider/model/events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currencyFormatter = NumberFormat("#,##0.00", "th-TH");

  final BorderRadius radius = BorderRadius.circular(8);

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection("events").snapshots(),
      builder: (context, eventSnapshot) => eventSnapshot.hasData
          ? ListView.builder(
              padding: EdgeInsets.only(bottom: 80),
              itemCount: eventSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot eventData = eventSnapshot.data!.docs[index];
                return Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  height: 128,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: radius,
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: radius,
                      ),
                      splashColor: Colors.deepOrange.withAlpha(30),
                      onTap: () {
                        print(eventData.id.toString());
                      },
                      child: ListTile(
                        // contentPadding: EdgeInsets.all(24),
                        title: Text(
                          eventData['name'],
                          style: TextStyle(fontSize: 36),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: DateFormat('MMM dd, yyyy')
                                      .format(eventData['date'].toDate())
                                      .toString()),
                              TextSpan(
                                text: "\n" + eventData['description'],
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                        trailing: StreamBuilder<QuerySnapshot>(
                          stream: db
                              .collection('events')
                              .doc(eventData.id)
                              .collection('items')
                              .snapshots(),
                          builder: (context, itemSnapshot) {
                            return itemSnapshot.hasData
                                ? setBudget(currencyFormatter
                                    .format(getBudget(itemSnapshot)))
                                : setBudget('0');
                          },
                        ),
                        isThreeLine: true,
                      ),
                    ),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // function คำนวณราคานำไปคูณกับจำนวน จะได้เป็นราคารวม
  double getBudget(AsyncSnapshot<QuerySnapshot> itemSnapshot) {
    return itemSnapshot.data!.docs
        .fold(0, (tot, doc) => tot + (doc['price'] * doc['unit']));
  }

  RichText setBudget(String budget) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: budget.toString(),
            style: TextStyle(fontSize: 24),
          ),
          TextSpan(
            text: "\nBAHT",
          ),
        ],
      ),
    );
  }
}
