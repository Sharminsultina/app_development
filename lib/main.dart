import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreenState(),
      title: "App",
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF9e9e9e),
          ),
        ),
      ),
    );
  }

}

class HomeScreenState extends StatefulWidget{
  const HomeScreenState({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();

}

class HomeScreenUI extends State<HomeScreenState>{
  String activeOnClick = "null";

  @override
  Widget build(BuildContext context) {

    void appSnackBar(context, String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Size Selector"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Wrap(
          spacing: 5,
          runSpacing: 6,
          children: [
            ElevatedButton(
                onPressed: (){
                  activeOnClick = "S";
                  appSnackBar(context, "S");
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(activeOnClick == "S" ? 0xFFff9800 : 0xFF9e9e9e),
                ),
                child: const Text("S")
            ),
            ElevatedButton(
                onPressed: (){
                  activeOnClick = "M";
                  appSnackBar(context, "M");
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(activeOnClick == "M" ? 0xFFff9800 : 0xFF9e9e9e),
                ),
                child: const Text("M")
            ),
            ElevatedButton(
                onPressed: (){
                  activeOnClick = "L";
                  appSnackBar(context, "L");
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(activeOnClick == "L" ? 0xFFff9800 : 0xFF9e9e9e),
                ),
                child: const Text("L")
            ),
            ElevatedButton(
                onPressed: (){
                  activeOnClick = "XL";
                  appSnackBar(context, "XL");
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(activeOnClick == "XL" ? 0xFFff9800 : 0xFF9e9e9e),
                ),
                child: const Text("XL")
            ),
            ElevatedButton(
                onPressed: (){
                  activeOnClick = "XXL";
                  appSnackBar(context, "XXL");
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(activeOnClick == "XXL" ? 0xFFff9800 : 0xFF9e9e9e),
                ),
                child: const Text("XXL")
            ),
            ElevatedButton(
                onPressed: (){
                  activeOnClick = "XXXL";
                  appSnackBar(context, "XXXL");
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(activeOnClick == "XXXL" ? 0xFFff9800 : 0xFF9e9e9e),
                ),
                child: const Text("XXXL")
            ),
          ],
        ),
      ),
    );
  }

}
