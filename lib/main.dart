import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final double price;
  int counter = 0;

  Product({required this.name, required this.price});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: "iPhone 15 Pro", price: 899.99),
    Product(name: "Samsung Galaxy S23", price: 899.99),
    Product(name: "MacBook Air", price: 1199.99),
    Product(name: "Dell XPS 13", price: 849.99),
    Product(name: "Sony PlayStation 5", price: 499.99),
    Product(name: "Vivo23", price: 749.99),
    Product(name: "Xbox Series X", price: 599.99),
    Product(name: "AirPods Pro", price: 249.99),
    Product(name: "Sony Xperia 5 ", price: 745.99),
    Product(name: "Samsung 4K Smart TV", price: 799.99),
    Product(name: "Xiaomi Mi Note 10", price: 149.99),
    Product(name: "Nikon D850 DSLR Camera", price: 1999.99),
    Product(name: "Air Pods Pro", price: 330.99),
    Product(name: "Walton Monitor", price: 129.99),
    Product(name: "Google Chromecast", price: 89.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true, // Center-align the title text
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  product.counter++;
                  if (product.counter == 5) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Congratulations!"),
                          content: Text("You've bought 5 ${product.name}!"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
              child: Text("Buy Now"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(
                totalProductsBought: products
                    .map((product) => product.counter)
                    .reduce((a, b) => a + b),
              ),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final int totalProductsBought;

  CartPage({required this.totalProductsBought});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true, // Center-align the title text
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Products Bought: $totalProductsBought"),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the ProductList page
                Navigator.of(context).pop();
              },
              child: Text("Go Back to Product List"),
            ),
          ],
        ),
      ),
    );
  }
}