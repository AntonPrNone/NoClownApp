// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

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
      return CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050, 12, 31),
          onDateChanged: (DateTime value) {});
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
