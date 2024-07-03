
import 'package:firebase_app/app/chat/models/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isMine;
  final Message message;

  const MessageWidget({
    super.key,
    required this.isMine,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine
        ? Alignment.centerRight
        : Alignment.centerLeft, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isMine ? Colors.blue : Colors.orange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.nickname,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xffF1F1F1),
              ),
            ),
            Text(
              message.text,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xffF1F1F1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
