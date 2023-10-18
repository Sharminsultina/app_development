import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class UserProfile {
  final String name;
  final String batch;

  UserProfile({required this.name, required this.batch});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProfile johanDoe = UserProfile(name: "Johan Doe", batch: "Flutter Batch 4");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile_icon.png'), // Add the path to your profile icon image
              ),
              SizedBox(height: 20),
              Text(
                'Name: ${johanDoe.name}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Batch: ${johanDoe.batch}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
