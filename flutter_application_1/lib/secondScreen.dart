// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/WidgetCalendarPage.dart';
import 'package:flutter_application_1/WidgetDealPage.dart';

List<String> users = [
  "Сходить в магазин",
  "Flutter",
  "Поиграть НЕ в доту",
  "Сходить за посылкой"
];
List<String> companies = [
  "Купить молоко, хлеб, сыр",
  "Прописать flutter upgrade",
  "Выиграть в ИЧ",
  "Сходить за посылкой на почту"
];
List<Widget> icons = [
  Icon(Icons.abc),
  Icon(Icons.ac_unit),
  Icon(Icons.access_alarm),
  Icon(Icons.accessibility),
  Icon(Icons.account_box),
  Icon(Icons.adb),
  Icon(Icons.add_a_photo),
  Icon(Icons.admin_panel_settings),
  Icon(Icons.air),
  Icon(Icons.album_sharp),
  Icon(Icons.hail)
];

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int index = 0;
  String? dialogTitle;
  String? dialogSubtitle;

  final formKeyDialog = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget calendarPage(BuildContext context) {
      return CalendarPage();
    }

    Widget dealPage(BuildContext context) {
      return DealPage();
    }

    final list = [
      dealPage(context),
      calendarPage(context),
    ];

    return Scaffold(
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
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
      ]),
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
                content: SizedBox(
                  height: 225,
                  child: Center(
                    child: Form(
                      key: formKeyDialog,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10), 
                            width: 325.0,
                            child: TextFormField(
                              onSaved: (value) => dialogTitle = value,
                              decoration: InputDecoration(labelText: "Title"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 325.0,
                            child: TextFormField(
                              onSaved: (value) => dialogSubtitle = value,
                              decoration:
                                  InputDecoration(labelText: "Subtitle"),
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
                                formKeyDialog.currentState?.save();
                                AddItem(dialogTitle, dialogSubtitle);
                                Navigator.pushNamed(context, '/second');
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
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
