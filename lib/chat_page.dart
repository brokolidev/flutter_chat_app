import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/chat_message_entity.dart';
import 'package:flutter_chat_app/widgets/chat_bubble.dart';
import 'package:flutter_chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi, $username!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatBubble(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    entity: ChatMessageEntity(
                      id: '1234',
                      text: 'Hello, This is Ted',
                      imageUrl:
                          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
                      createdAt: DateTime.now().millisecondsSinceEpoch,
                      author: Author(userName: 'Brokoli'),
                    ));
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
