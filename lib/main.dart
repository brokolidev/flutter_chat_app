import 'package:flutter_chat_app/chat_page.dart';
import 'package:flutter_chat_app/widgets/counter_stateful_demo.dart';

import 'login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ChatPage(),
    );
  }
}
