import 'package:flutter/material.dart';
import 'package:flutter_chat_app/chat_page.dart';
import 'package:flutter_chat_app/login_page.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:flutter_chat_app/utils/brand_color.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthService.init();

  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            canvasColor: Colors.transparent,
            primarySwatch: BrandColor.primaryColor,
            appBarTheme: AppBarTheme(
              backgroundColor: BrandColor.bgColor,
              foregroundColor: BrandColor.foreColor,
            )),
        home: FutureBuilder<bool>(
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!) {
                return const ChatPage();
              } else {
                return LoginPage();
              }
            }
            return const CircularProgressIndicator();
          },
          future: context.watch<AuthService>().isLoggedIn(),
        ),
        routes: {'/chat': (context) => ChatPage()});
  }
}
