import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../helper/Constants.dart';

class MessageSpace extends StatelessWidget {
  MessageSpace({super.key, required this.send,required this.controller1,required this.email});
final ScrollController controller1 ;
  TextEditingController controller = TextEditingController();
  CollectionReference massages = FirebaseFirestore.instance.collection(
    kCollection,
  );
  VoidCallback send;
  String? message;

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8, bottom: 18),
      child: TextField(
        controller: controller,
        onChanged: (data) {
          message = data;
        },
        decoration: InputDecoration(
          hint: Text(
            "Message",
            style: TextStyle(fontSize: 18, color: kSubColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: kSubColor, width: 1.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: kSubColor, width: 1.2),
          ),
          suffixIcon: GestureDetector(
            child: IconButton(
              onPressed: () {
                massages.add({
                  "message": message,
                  kCreatedAt: DateTime.now(),
                  "id": email
                });
                controller.clear();
                controller1.animateTo(
                  controller1.position.maxScrollExtent,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 2),
                );
              },
              icon: Icon(Icons.send, color: kSubColor, size: 30),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        ),
      ),
    );
  }
}
