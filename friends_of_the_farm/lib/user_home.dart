// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:friends_of_the_farm/admin.dart';
import 'package:friends_of_the_farm/profile_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = <Widget>[
    const UserHomePage(),
    const AdminScreen(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends of the Farm'),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        //When an item gets selected we go into a function where we save the index and use that to create the tasks
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Text('Your Next Tasks:'),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.apple),
              title: Text('Water Garden Plots XYZ'),
              subtitle: Text('10:30 AM'),
            ),
            ListTile(
              leading: Icon(Icons.catching_pokemon),
              title: Text('Feed the Chickens'),
              subtitle: Text('11:00 AM'),
            ),
          ],
        ),
      ),
      ElevatedButton(
        key: const Key("HoursWorked"),
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            primary: Colors.blueAccent),
        child: Text('See Hours Worked'),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
            title: const Text('Hours Worked'),           // To display the title it is optional
            content: Text('3 hours on 11/04/2022'),

              /*actions: [
                FlatButton(                     // FlatButton widget is used to make a text to work like a button
                  textColor: Colors.black,
                  onPressed: () {},             // function used to perform after pressing the button
                  child: Text('OK'),
                ),
              ],*/
          );
            });
          
        },
      ),
    ]);
  }
}
