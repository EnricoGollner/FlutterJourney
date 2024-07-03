import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/app/chat/models/message.dart';
import 'package:firebase_app/app/chat/screens/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final String nickName;

  const ChatScreen({super.key, required this.nickName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FirebaseFirestore _db;
  final TextEditingController _messageCtrl = TextEditingController();
  String userId = '';

  @override
  void initState() {
    _db = FirebaseFirestore.instance;
    WidgetsBinding.instance.addPostFrameCallback((_) async => await _loadUser());
    super.initState();
  }

  Future<void> _loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => userId = prefs.getString('userId')!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat - Sala'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _db.collection('chats').snapshots(),
              builder: (context, snapshot) {

                return !snapshot.hasData
                    ? const CircularProgressIndicator()
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final Message message = Message.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);
                            final bool isMine = message.userId == userId;

                            return MessageWidget(
                              isMine: isMine,
                              message: message,
                            );
                          },
                        ),
                    );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _messageCtrl,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blueAccent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final String? userId = await SharedPreferences.getInstance().then((pref) => pref.getString('userId'));
    final Message message = Message(
      userId: userId!,
      text: _messageCtrl.text,
      nickname: widget.nickName,
    );

    await _db.collection('chats').add(message.toJson());
    _messageCtrl.clear();
  }
}
