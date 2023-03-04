// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050, 12, 31),
        onDateChanged: (DateTime value) {});
  }
}
