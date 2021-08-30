import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'event_view/new_event.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _children = [HomePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search Event',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('This feature is not support.'),
                ));
              },
            )
          ]),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 8,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person_rounded), label: "Profile")
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewEvent()),
          );
        },
        label: const Text('Add Event'),
        icon: const Icon(Icons.add_rounded),
      ),
    );
  }
}
