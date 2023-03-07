// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'secondScreen.dart';

class DealPage extends StatefulWidget {
  const DealPage({super.key});

  @override
  State<DealPage> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  void DeleteAdd(String? T, String? ST) async {
    if (T == null) {
      users.remove("");
    } else {
      users.remove(T);
    }

    if (ST == null) {
      companies.remove("");
    } else {
      companies.remove(ST);
    }

    await _setData();
  }

  Future _setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("UsersList", users);
    prefs.setStringList("CompaniesList", companies);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.red),
                            color: Color.fromARGB(255, 108, 75, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(8),
                        child: Padding(
                            padding: EdgeInsets.zero,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: icons[index],
                            ))),
                  );
                }),
          ),
        ),
        Expanded(
          flex: 8,
          child: SizedBox(
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: users.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          color: Color.fromARGB(255, 201, 201, 201),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                          title: Text(users[index],
                              style: TextStyle(fontSize: 20)),
                          leading: Text(
                            (index + 1).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            companies[index],
                          )),
                    );
                  })),
        )
      ],
    );
  }
}
