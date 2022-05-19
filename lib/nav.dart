import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:sign_it_in/home_screen.dart';
import 'package:sign_it_in/browse_screen.dart';
import 'package:sign_it_in/checkbox.dart';
import 'package:sign_it_in/radio/radio_main.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Interns 4 You'),
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            bottom: TabBar(indicatorColor: Colors.yellow, indicatorWeight: 5,
                //isScrollable: true,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.star), text: 'Feed'),
                  Tab(icon: Icon(Icons.face), text: 'Browse'),
                  Tab(icon: Icon(Icons.settings), text: 'Settings'),
                ]),
            backgroundColor: Colors.orange,
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(children: [
            Home(),
            Radio_MyApp(),
            Browse_Home(),
            //buildPage('Setting Page'),
            CheckBoxes(),
          ])));

  Widget buildPage(String text) => Center(
        child: ElevatedButton(
            onPressed: addData,
            child: Text('Query by friend count'),
            style: ElevatedButton.styleFrom(primary: Colors.blue)),
      );
}

void addData() async {
  var profile = ParseObject('Profile');
  profile.set('name', 'username');
  profile.set('birthDay', DateTime.parse('1966-09-09'));
  profile.set('friendCount', 2);
  profile.set('favoriteFoods', ['Lobster', 'Bread']);
  await profile.save();
}
