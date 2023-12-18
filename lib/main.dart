import 'package:flutter/material.dart';
import 'package:flutter_chat_app/chat_page.dart';
import 'package:flutter_chat_app/utils/brand_color.dart';

import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: BrandColor.primaryColor,
            appBarTheme: AppBarTheme(
              backgroundColor: BrandColor.bgColor,
              foregroundColor: BrandColor.foreColor,
            )),
        home: LoginPage(),
        routes: {'/chat': (context) => ChatPage()});
  }
}
