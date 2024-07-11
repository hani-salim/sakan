import 'package:flutter/material.dart';

AlertDialog alertDialogWidget(
    String title, String content, BuildContext context) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.black38)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
