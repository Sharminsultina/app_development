import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingListPage(),
    );
  }
}

class ShoppingListPage extends StatelessWidget {
  final List<String> shoppingItems = [
    'Apples',
    'Bananas',
    'Bread',
    'Milk',
    'Eggs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Shopping List', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cart is empty')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.shopping_basket,),
            title: Text(shoppingItems[index],style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
          );
        },
      ),
    );
  }
}