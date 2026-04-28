import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
   ButtonWidget({super.key, required this.name, required this.onTap});

  final String name;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        width: MediaQuery.sizeOf(context).width * .9,
        height: 60,
        child: Center(child: Text(name, style: TextStyle(fontSize: 28))),
      ),
    );
  }
}
