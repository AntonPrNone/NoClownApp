// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'secondScreen.dart';

class DealPage extends StatefulWidget {
  const DealPage({super.key});

  @override
  State<DealPage> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  @override
  Widget build(BuildContext context) {
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
}
