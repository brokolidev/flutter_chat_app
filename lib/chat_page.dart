import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/chat_bubble.dart';
import 'package:flutter_chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hi! Ted!'),
        actions: [
          IconButton(
            onPressed: () {
              print('Icon pressed!!');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ChatBubble(
                  alignment: Alignment.centerLeft,
                  message: "Hello, this is Ted",
                ),
                ChatBubble(
                  alignment: Alignment.centerRight,
                  message: "Hey!!",
                ),
                ChatBubble(
                  alignment: Alignment.centerLeft,
                  message: "Good to see you!",
                ),
              ],
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
