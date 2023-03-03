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
  String? DialogTitle;
  String? DialogSubtitle;

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
                  trailing: Icon(Icons.delete_forever),
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Введите данные"),
              content: Container(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 325.0,
                    child: TextFormField(
                      onSaved: (value) => DialogTitle = value,
                      decoration: InputDecoration(labelText: "Title"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 325.0,
                    child: TextFormField(
                      onSaved: (value) => DialogSubtitle = value,
                      decoration: InputDecoration(labelText: "Subtitle"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      color: Theme.of(context).colorScheme.secondary,
                      height: 50.0,
                      minWidth: 150.0,
                      onPressed: () {
                        AddItem(DialogTitle, DialogSubtitle);
                      },
                      child: Text(
                        "LOGIN",
                      ),
                    ),
                  )
                ],
              )),
            ),
          );
        },
        child: Icon(Icons.add),
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

void AddItem(String? T, String? ST) {
  if (T == null) {
    users.add(" ");
  } else {
    users.add(T);
  }

  if (ST == null) {
    companies.add(" ");
  } else {
    companies.add(ST);
  }
}
