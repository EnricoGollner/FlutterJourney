import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String userId = '';
  String text = '';
  String nickname = '';
  DateTime sendedAt = DateTime.now();

  Message({
    required this.userId,
    required this.text,
    required this.nickname,
  });

  Message.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    text = json['text'];
    nickname = json['nickname'];
    sendedAt = (json['sendedAt'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['text'] = text;
    data['nickname'] = nickname;
    data['sendedAt'] = Timestamp.fromDate(sendedAt);

    return data;
  }
}
