import 'package:flutter/material.dart';
import 'package:flutter_chat_app/chat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  void loginUser(context) {

    // 폼 벨리데이션을 위해 아래 한 줄을 추가
    if(_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);
      
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatPage(
                  username: userNameController.text,
                ),
          )
      );

      print('login successful!!!!');
    }

  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Image.network(
                'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
                height: 200,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if(value != null && value.isNotEmpty && value.length < 5) {
                            return "Your username should be more than 5 characters.";
                          } else if (value != null && value.isEmpty) {
                            return "Please type your username.";
                          }

                          return null;
                        },
                        controller: userNameController,
                        // for validation when each character typed
                        // onChanged: (value) {
                        //   print('value: $value');
                        // },
                        decoration: InputDecoration(
                          hintText: 'Add your username',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Add your password',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  loginUser(context);
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
              InkWell(
                onDoubleTap: () {
                  print('Double Tabped!!!');
                },
                onLongPress: () {
                  print('Long Pressed.');
                },
                onTap: () {
                  print('Link Clicked!!');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://brokolidev.com'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
