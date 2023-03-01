// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

final List<String> users = ["Tom", "Bob", "Sam", "Mike"];
final List<String> companies = ["Google", "Microsoft", "Apple", "JetBrains"];

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget calendarPage(BuildContext context) {
      return ListView();
    }

    Widget dealPage(BuildContext context) {
      return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(users[index], style: TextStyle(fontSize: 22)),
                leading: Icon(Icons.face),
                trailing: Icon(Icons.phone),
                subtitle: Text("Works in ${companies[index]}"));
          });
    }

    final list = [
      dealPage(context),
      calendarPage(context),
    ];
    return Scaffold(
      body: list.elementAt(index),
      appBar: AppBar(title: Text("To-Do List")),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To-do list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
        ],
        selectedItemColor: Colors.red,
      ),
    );
  }
}
