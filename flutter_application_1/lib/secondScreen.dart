// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

final List<String> users = [
  "Сходить в магазин",
  "Flutter",
  "Поиграть НЕ в доту",
  "Сходить за посылкой"
];
final List<String> companies = [
  "Купить молоко, хлеб, сыр",
  "Прописать flutter upgrade",
  "Выиграть в ИЧ",
  "Сходить за посылкой на почту"
];
final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
var items = <String>[];

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int index = 0;
  TextEditingController editingController = TextEditingController();

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
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: Color.fromARGB(255, 201, 201, 201),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                  title: Text(users[index], style: TextStyle(fontSize: 22)),
                  leading: Text(
                    (index + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.phone),
                  subtitle: Text(
                    companies[index],
                  )),
            );
          });
    }

    final list = [
      dealPage(context),
      calendarPage(context),
    ];
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: editingController,
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Expanded(
          child: list.elementAt(index),
        )
      ])),
      appBar: AppBar(
          title: Text(
        "To-Do List",
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(),
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

void filterSearchResults(String query) {
  List<String> dummySearchList = <String>[];
  dummySearchList.addAll(users);
  if (query.isNotEmpty) {
    List<String> dummyListData = <String>[];
    dummySearchList.forEach((item) {
      if (item.contains(query)) {
        dummyListData.add(item);
      }
    });
    items.clear();
    items.addAll(users);
    return;
  } else {
    items.clear();
    items.addAll(users);
  }
}
