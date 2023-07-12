// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'secondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/second',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/second': (BuildContext context) => SecondScreen()
      }
    );
  }
}

//ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);
  String? _email;
  String? _password;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset(
                    "assets/imgs/icon.png",
                    width: 100,
                  ),
                ),
                Text(
                  'ClownApp',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 325.0,
              child: TextFormField(
                onSaved: (val) => _email = val,
                validator: (val) =>
                    val == null || !(val.contains("@") && val.contains("."))
                        ? 'Not a valid email.'
                        : null,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                style: _sizeTextBlack,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 325.0,
              child: TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                style: _sizeTextBlack,
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
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/second');
                  }
                },
                child: Text(
                  "LOGIN",
                  style: _sizeTextWhite,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  // submit(BuildContext context) {
  //   final form = formKey.currentState;
  //   if (form != null && form.validate()) {
  //     form.save();
  //     performLogin(context);
  //   }
  // }

  // void performLogin(BuildContext context) {
  //   hideKeyboard();
  //   Navigator.pushNamed(context, '/second');
  // }

  // void hideKeyboard() {
  //   SystemChannels.textInput.invokeMethod('TextInput.hide');
  // }
}
