import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No messages found.'));
        }

        final loadedMessages = snapshot.data!.docs;

        return ListView.builder(
          itemCount: loadedMessages.length,
          itemBuilder: (context, index) {
            return Text(loadedMessages[index].data()['text']);
          },
        );
      },
    );
  }
}
