import 'package:flutter/material.dart';
import 'package:divider/model/events.dart';
import 'package:divider/view/event_view/event_tab/items_tab.dart';
import 'package:divider/view/event_view/event_tab/people_tab.dart';
import 'package:divider/view/event_view/event_tab/summary_tab.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key, required this.events}) : super(key: key);

  final Events events;

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent>
    with AutomaticKeepAliveClientMixin {
  final List<Tab> _tabList = const [
    Tab(text: "Items", icon: Icon(Icons.receipt_long_rounded)),
    Tab(text: "People", icon: Icon(Icons.groups_rounded)),
    Tab(text: "Summary", icon: Icon(Icons.done_all_rounded)),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: _tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.events.eventName),
          bottom: TabBar(
            tabs: _tabList,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ItemsTab(),
            PeopleTab(),
            SummaryTab(),
          ],
        ),
      ),
    );
  }
}
