import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:flutter_chat_app/utils/spaces.dart';
import 'package:flutter_chat_app/widgets/login_text_field.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    // 폼 벨리데이션을 위해 아래 한 줄을 추가
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      await context.read<AuthService>().loginUser(userNameController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final _mainUri = Uri(scheme: 'https', host: 'brokolidev.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Let\'s sign you in!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const Text(
                'Welcome back! \nYou\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/free.jpeg'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      LoginTextField(
                          controller: userNameController,
                          hintText: '아이디를 입력해주세요.',
                          validator: (value) {
                            if (value != null &&
                                value.isNotEmpty &&
                                value.length < 5) {
                              return "Your username should be more than 5 characters.";
                            } else if (value != null && value.isEmpty) {
                              return "Please type your username.";
                            }

                            return null;
                          }),
                      verticalSpacing(10),
                      LoginTextField(
                          controller: passwordController,
                          hintText: '패스워드를 입력해주세요',
                          isSecure: true,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "패스워드를 입력해주세요.";
                            }

                            return null;
                          }),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await loginUser(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  print('This is OutlinedButton!');
                },
                child: const Icon(Icons.flutter_dash),
              ),
              GestureDetector(
                onTap: () async {
                  if (!await launchUrl(_mainUri,
                      mode: LaunchMode.inAppBrowserView)) {
                    throw 'Could not launch this!';
                  }
                },
                child: Column(
                  children: [
                    const Text('Find us on'),
                    Text(_mainUri.toString()),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.twitter(
                    color: Colors.blue,
                    url: 'https://twitter.com/hyunseung_c',
                  ),
                  SocialMediaButton.github(
                    url: 'https://github.com/brokolidev',
                  ),
                  SocialMediaButton.linkedin(
                    color: Colors.blueAccent,
                    url: 'https://linkedin.com/in/brokolidev',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
