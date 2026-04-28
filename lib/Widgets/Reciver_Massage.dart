import 'package:flutter/material.dart';
import 'package:shaats/Models/Message_Model.dart';
import '../helper/Constants.dart';

class ReceiverMassage extends StatelessWidget {
  const ReceiverMassage({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
      child: Align(
        alignment: AlignmentGeometry.centerRight,
        child: Container(
          // width: MediaQuery.sizeOf(context).width*.7 ,
          decoration: BoxDecoration(
            color: kSubColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(.1),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
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
