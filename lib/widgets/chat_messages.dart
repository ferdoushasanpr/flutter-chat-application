import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No messages found.'));
        }

        final loadedMessages = snapshot.data!.docs;
        final currentUser = FirebaseAuth.instance.currentUser;

        return ListView.builder(
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (context, index) {
            final msg = loadedMessages[index].data();

            return ChatMessageBubble(
              message: msg['text'],
              userName: msg['user_name'],
              isMe: msg['user_id'] == currentUser!.uid,
            );
          },
        );
      },
    );
  }
}
