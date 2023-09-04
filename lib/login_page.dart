import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('button Clicked!');
        },
      ),
      body: Column(
        children: [
          Text(
            'Let\'s sign you in!!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Welcome back! \nYou\'ve been missed!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
            height: 200,
          ),
          Container(
            height: 150,
            width: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
                  )),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
          )
        ],
      ),
    );
  }
}
