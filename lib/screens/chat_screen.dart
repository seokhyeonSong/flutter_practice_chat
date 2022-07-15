import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/chat/messages.dart';
import '../widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseInstance = FirebaseFirestore.instance
        .collection('chats/9HtkwtDoDP78JX3O87Lu/messages');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout')
                    ],
                  ),
                ),
              ],
              onChanged: (itemIdetifier) async {
                if (itemIdetifier == 'logout') {
                  await FirebaseAuth.instance.signOut();
                }
              },
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      ),
      // StreamBuilder(
      //   stream: firebaseInstance.snapshots(),
      //   builder: (ctx,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> streamSnapshot) {
      //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final documents = streamSnapshot.data!.docs;
      //     return ListView.builder(
      //       itemCount: streamSnapshot.data!.docs.length,
      //       itemBuilder: (ctx, index) => Container(
      //         padding: const EdgeInsets.all(8),
      //         child: Text(documents[index]['text']),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
