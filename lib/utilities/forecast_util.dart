import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, String value, String units) {
    return Column(
      children: [
        Icon(iconData, size: 28, color: Colors.indigo),
        SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(height: 10),
        Text(units, style: TextStyle(fontSize: 15, color: Colors.black))
      ],
    );
  }
}
