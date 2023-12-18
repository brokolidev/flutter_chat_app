import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_app/models/chat_message_entity.dart';
import 'package:flutter_chat_app/models/image_model.dart';
import 'package:flutter_chat_app/widgets/chat_bubble.dart';
import 'package:flutter_chat_app/widgets/chat_input.dart';
import 'package:http/http.dart' as http;

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

      setState(() {
        _messages = chatMessages;
      });
    });
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  _getNetworkImages() async {
    var endpointUrl =
        Uri.parse('https://api.unsplash.com/photos/random?count=10');

    final response = await http.get(endpointUrl,
        headers: {HttpHeaders.authorizationHeader: 'Client-ID secret'});

    final List<dynamic> decodeList = jsonDecode(response.body) as List;
    final List<UnsplashImage> randomImages = decodeList.map((listItem) {
      return UnsplashImage.fromJson(listItem);
    }).toList();
  }

  @override
  void initState() {
    _loadInitialMessages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
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
                    alignment: _messages[index].author.userName == 'pooja26'
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
