import 'package:flutter/material.dart';

import '../Models/Message_Model.dart';
import '../helper/Constants.dart';

class SenderMassage extends StatelessWidget {
  const SenderMassage({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
      child: Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Container(
          // width: MediaQuery.sizeOf(context).width*.7 ,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(.1),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
            child: Text(
              messageModel.message,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
