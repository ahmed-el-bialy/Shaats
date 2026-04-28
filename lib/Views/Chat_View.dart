import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaats/Models/Message_Model.dart';
import 'package:shaats/Widgets/Message_Space.dart';
import 'package:shaats/Widgets/Reciver_Massage.dart';
import 'package:shaats/Widgets/Sender_Massage.dart';

import '../helper/Constants.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  static String id = "Chat View";
  FirebaseFirestore db = FirebaseFirestore.instance;
  Query<Map<String, dynamic>> massages = FirebaseFirestore.instance
      .collection(kCollection)
      .orderBy(kCreatedAt);

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 5,
        title: Text(
          "Shaats",
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontFamily: "DeliusSwashCaps",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: massages.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MessageModel> messageList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    messageList.add(
                      MessageModel.fromJson(snapshot.data!.docs[i]),
                    );
                  }
                  return ListView.builder(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    itemCount: messageList.length,
                    itemBuilder: (context, int index) {
                      return email == messageList[index].id
                          ? SenderMassage(messageModel: messageList[index])
                          : ReceiverMassage(messageModel: messageList[index]);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          MessageSpace(send: () {}, controller1: controller, email: email),
        ],
      ),
    );
  }
}
