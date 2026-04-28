import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(massage, style: TextStyle(color: Colors.black)),
    ),
  );
}