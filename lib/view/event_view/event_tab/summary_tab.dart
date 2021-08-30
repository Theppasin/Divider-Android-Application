import 'package:flutter/material.dart';

class SummaryTab extends StatefulWidget {
  const SummaryTab({Key? key}) : super(key: key);

  @override
  _SummaryTabState createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Container(
      // child: SingleChildScrollView(
      //   child: Card(
      //     margin: EdgeInsets.all(16),
      //     elevation: 8,
      //     child: DataTable(
      //       columns: <DataColumn>[
      //         DataColumn(
      //           label: Text(
      //             'Name',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         DataColumn(
      //           label: Text(
      //             'Wasted',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           numeric: true,
      //         ),
      //         DataColumn(
      //           label: Text(
      //             'Paid',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           numeric: true,
      //         ),
      //         DataColumn(
      //           label: Text(
      //             "Total\n(${currencyFormatter.format(itemList.map((item) => (item.itemPrice * item.itemUnit)).reduce((a, b) => a + b))})",
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //             textAlign: TextAlign.center,
      //           ),
      //           numeric: true,
      //         ),
      //       ],
      //       rows: peopleList
      //           .map((people) => DataRow(
      //         cells: <DataCell>[
      //           DataCell(
      //             Text(people.peopleName),
      //           ),
      //           DataCell(
      //             Text(
      //               currencyFormatter.format(
      //                 _wasteCalculator(people),
      //               ),
      //             ),
      //           ),
      //           DataCell(
      //             TextField(
      //               controller: people.peoplePaidController,
      //               textAlign: TextAlign.end,
      //               onSubmitted: (text) {
      //                 print("Person paid: $text");
      //                 people.peoplePaid = double.parse(text);
      //                 setState(() {});
      //                 node.unfocus();
      //               },
      //               onEditingComplete: () => setState(() {}),
      //               keyboardType: TextInputType.number,
      //               textInputAction: TextInputAction.done,
      //               decoration: InputDecoration(
      //                 hintText: '0',
      //               ),
      //             ),
      //           ),
      //           DataCell(
      //             getTotal(people),
      //           ),
      //         ],
      //       ))
      //           .toList(),
      //     ),
      //   ),
      // ),
    );
  }
}
