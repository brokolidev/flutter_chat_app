import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              ElevatedButton(
                onPressed: () {
                  print('clicked!');
                },
                child: const Text(
                  'Click Me!',
                  style: TextStyle(
                    fontSize: 30,
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
