import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemsTab extends StatefulWidget {
  const ItemsTab({Key? key}) : super(key: key);

  @override
  _ItemsTabState createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  final currencyFormatter = NumberFormat("#,##0.##", "th-TH");

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     var item = new Items();
      //     itemList.add(item);
      //     setState(() {});
      //   },
      //   label: Text("Add item"),
      //   icon: Icon(Icons.add_circle_rounded),
      // ),
      // body: SingleChildScrollView(
      //   child: Card(
      //     margin: EdgeInsets.fromLTRB(16, 16, 16, 128),
      //     elevation: 8,
      //     child: DataTable(
      //       columns: const <DataColumn>[
      //         DataColumn(
      //           label: Text(
      //             'Item',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         DataColumn(
      //           label: Text(
      //             'Price',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           numeric: true,
      //         ),
      //         DataColumn(
      //           label: Text(
      //             'Amount',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           numeric: true,
      //         ),
      //         DataColumn(
      //           label: Text(
      //             'Total',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           numeric: true,
      //         ),
      //       ],
      //       rows: itemList
      //           .map(
      //         ((items) => DataRow(
      //           cells: <DataCell>[
      //             DataCell(
      //               TextField(
      //                 controller: items.itemNameController,
      //                 onSubmitted: (text) {
      //                   print("Item name: $text");
      //                   items.itemName = text;
      //                   setState(() {});
      //                 },
      //                 onEditingComplete: () {
      //                   setState(() {});
      //                   node.nextFocus();
      //                 },
      //                 textInputAction: TextInputAction.next,
      //                 decoration: InputDecoration(
      //                   hintText: "Item name",
      //                 ),
      //               ),
      //             ),
      //             DataCell(
      //               TextField(
      //                 controller: items.itemPriceController,
      //                 textAlign: TextAlign.end,
      //                 onSubmitted: (text) {
      //                   print("Item price: $text");
      //                   items.itemPrice = double.parse(text);
      //                   setState(() {});
      //                 },
      //                 onEditingComplete: () {
      //                   setState(() {});
      //                   node.nextFocus();
      //                 },
      //                 keyboardType: TextInputType.number,
      //                 textInputAction: TextInputAction.next,
      //                 decoration: InputDecoration(
      //                   hintText: '0',
      //                 ),
      //               ),
      //             ),
      //             DataCell(
      //               TextField(
      //                 controller: items.itemUnitController,
      //                 textAlign: TextAlign.end,
      //                 onSubmitted: (text) {
      //                   print("Item unit: $text");
      //                   items.itemUnit = int.parse(text);
      //                   node.unfocus();
      //                   setState(() {});
      //                 },
      //                 onEditingComplete: () => setState(() {}),
      //                 keyboardType: TextInputType.number,
      //                 textInputAction: TextInputAction.done,
      //                 decoration: InputDecoration(
      //                   hintText: '1',
      //                 ),
      //               ),
      //             ),
      //             DataCell(
      //               Text(currencyFormatter
      //                   .format(items.itemPrice * items.itemUnit)
      //                   .toString()),
      //             ),
      //           ],
      //         )),
      //       )
      //           .toList(),
      //     ),
      //   ),
      // ),
    );
  }
}
