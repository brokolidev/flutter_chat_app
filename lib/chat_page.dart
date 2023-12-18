import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/chat_message_entity.dart';
import 'package:flutter_chat_app/widgets/chat_bubble.dart';
import 'package:flutter_chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        text: 'Hello',
        id: '1',
        createdAt: 123412341234,
        author: Author(userName: 'brokoli')),
    ChatMessageEntity(
        text: 'Hello1',
        id: '2',
        imageUrl:
            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
        createdAt: 123412141234,
        author: Author(userName: 'brokoli2')),
    ChatMessageEntity(
        text: 'Hello2',
        id: '3',
        createdAt: 123412341234,
        author: Author(userName: 'brokoli')),
    ChatMessageEntity(
        text: 'Hello3',
        id: '4',
        createdAt: 121412341234,
        author: Author(userName: 'brokoli2')),
    ChatMessageEntity(
        text: 'Hello4',
        id: '5',
        createdAt: 123212341234,
        author: Author(userName: 'brokoli')),
    ChatMessageEntity(
        text: 'Hello5',
        id: '6',
        createdAt: 123432341234,
        author: Author(userName: 'brokoli2')),
    ChatMessageEntity(
        text: 'Hello6',
        id: '7',
        createdAt: 123414341234,
        author: Author(userName: 'brokoli')),
  ];

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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                    alignment: _messages[index].author.userName == 'brokoli'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    entity: _messages[index]);
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
