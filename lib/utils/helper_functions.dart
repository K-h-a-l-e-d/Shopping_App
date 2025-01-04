import 'package:flutter/material.dart';

void navigateTo(context, Widget route) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => route,
    ),
  );
}

void snackBarMsg(context, {String msg = "", String label = "OK"}) {
  SnackBar snackBar = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: label,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

bool hasCapitalFirstLetters(String fullName) {
  List<String> nameParts = fullName.split(' ');

  for (var namePart in nameParts) {
    if (namePart != "" && !firstLetterIsUpperCase(namePart)) {
      return false;
    }
  }
  return true;
}

bool firstLetterIsUpperCase(String name) {
  //Checking if the first letter is in ASCII Range of uppercase
  return name.codeUnitAt(0) >= 65 && name.codeUnitAt(0) <= 90;
}
