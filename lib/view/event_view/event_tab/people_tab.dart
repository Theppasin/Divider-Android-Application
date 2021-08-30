import 'package:flutter/material.dart';

class PeopleTab extends StatefulWidget {
  const PeopleTab({Key? key}) : super(key: key);

  @override
  _PeopleTabState createState() => _PeopleTabState();
}

class _PeopleTabState extends State<PeopleTab> {
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Container(
      // child: Scaffold(
      //   floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       var people = new People(
      //         List.filled(itemList.length, false, growable: true),
      //       );
      //       peopleList.add(people);
      //       print(_checkboxGenerator(people).length);
      //       setState(() {});
      //     },
      //     label: Text("Add people"),
      //     icon: Icon(Icons.person_add_rounded),
      //   ),
      //   body: SingleChildScrollView(
      //     child: Card(
      //       margin: EdgeInsets.all(16),
      //       elevation: 8,
      //       child: DataTable(
      //         columns: <DataColumn>[
      //           DataColumn(
      //             label: Text(
      //               'Name',
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           ..._buildItemColumn(),
      //         ],
      //         rows: peopleList
      //             .map(
      //           ((people) => DataRow(
      //             cells: <DataCell>[
      //               DataCell(
      //                 TextField(
      //                   controller: people.peopleNameController,
      //                   onSubmitted: (text) {
      //                     print("First text field: $text");
      //                     people.peopleName = text;
      //                     node.unfocus();
      //                   },
      //                   onEditingComplete: () => setState(() {}),
      //                   textInputAction: TextInputAction.done,
      //                   decoration: InputDecoration(
      //                     hintText: "Person name",
      //                   ),
      //                 ),
      //               ),
      //               ..._checkboxGenerator(people),
      //             ],
      //           )),
      //         )
      //             .toList(),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
