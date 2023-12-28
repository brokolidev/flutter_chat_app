import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_app/models/chat_message_entity.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:flutter_chat_app/widgets/chat_bubble.dart';
import 'package:flutter_chat_app/widgets/chat_input.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodeList = jsonDecode(response) as List;
      final List<ChatMessageEntity> chatMessages = decodeList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(chatMessages[0].author.userName);

      setState(() {
        _messages = chatMessages;
      });
    });
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().getUserName();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi, $username!'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().updateUserName('New Name!');
            },
            icon: const Icon(Icons.upcoming),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthService>().logoutUser();
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
                    alignment: _messages[index].author.userName ==
                            context.read<AuthService>().getUserName()
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    entity: _messages[index]);
              },
            ),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
