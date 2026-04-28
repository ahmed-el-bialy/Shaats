

import '../helper/Constants.dart';

class MessageModel {
  final String message ;
  final String id ;
  MessageModel(this.message, {required this.id});

  factory MessageModel.fromJson(jsonData){
    return MessageModel(jsonData[kMessage], id: jsonData["id"]);
  }
}