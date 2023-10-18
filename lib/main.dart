import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "Assignment Five",
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_business_outlined),
        title: Center(
          child: Text('Home'),
        ),
        actions: [
          Icon(Icons.search),
        ],
        backgroundColor: Colors.green,
        toolbarHeight: 100,
        elevation: 70,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('This is mod 5 Assignment', style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "My ", style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  )),
                  TextSpan(text: "phone ", style: TextStyle(color: Colors.blue)),
                  TextSpan(text: "name ", style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  )),
                  TextSpan(text: "Your phone name", style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber,
                  )),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

}