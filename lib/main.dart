import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            home: const HomeScreenState(),
            title: "Cart Screen",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFFF9F9F9),
                  elevation: 0,
                ),
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                  bodyMedium: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF222222),
                    fontWeight: FontWeight.w600,
                  ),
                  bodySmall: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9B9B9B),
                  ),
                  titleSmall: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF222222),
                  ),
                )
            ),
          );
        }
    );
  }

}

//====PRODUCT=====
class Product {
  String image;
  String name;
  int price;
  String color;
  String size;
  int quantity;

  Product(this.image, this.name, this.price, this.color, this.size,
      this.quantity);
}

class HomeScreenState extends StatefulWidget{
  const HomeScreenState({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();

}

class HomeScreenUI extends State<HomeScreenState>{
  double totalAmount = 0;
  List<Product> products =[
    Product('https://stylecaster.com/wp-content/uploads/2022/08/bestinternationalfashionbrands.png', 'Pollover', 34, 'Orange', 'M', 1),
    Product('https://stylecaster.com/wp-content/uploads/2022/08/bestinternationalfashionbrands.png', 'T-Shirt', 45, 'Black', 'L', 1),
    Product('https://stylecaster.com/wp-content/uploads/2022/08/bestinternationalfashionbrands.png', 'Sport Dress', 31, 'Pink', 'M', 1),
  ];

  void incrementQuantity(index, int quantity, price){
    products[index].quantity = quantity+1;
    totalAmount += price;
  }

  void decrementQuantity(index, int quantity, price){
    if(quantity > 1){
      products[index].quantity = quantity-1;
      totalAmount -= price;
    }
  }

  void customSnackBar(context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  void initState() {
    for(int i=0; i < products.length; i++){
      totalAmount += products[i].quantity*products[i].price;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.black, size: 24)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Bag", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Row(
                        children: [
                          Image.asset(products[index].image, fit: BoxFit.fill,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(products[index].name),
                                      RichText(text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Color: ' , style: Theme.of(context).textTheme.bodySmall),
                                            TextSpan(text: products[index].color , style: Theme.of(context).textTheme.titleSmall),
                                            TextSpan(text: ' Size: ', style: Theme.of(context).textTheme.bodySmall),
                                            TextSpan(text: products[index].size, style: Theme.of(context).textTheme.titleSmall),
                                          ]
                                      )),
                                      const SizedBox(height: 13),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                incrementQuantity(index, products[index].quantity, products[index].price);
                                                setState(() {});
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.all(0),
                                                elevation: 6,
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: const Icon(Icons.add),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(products[index].quantity.toString()),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                decrementQuantity(index, products[index].quantity, products[index].price);
                                                setState(() {});
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.all(0),
                                                elevation: 6,
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: const Icon(Icons.remove),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(Icons.more_vert),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 9,
                                    child: Text('${products[index].price}\$', style: Theme.of(context).textTheme.bodyMedium,),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 95,
              color: const Color(0xFF989393),
            ),
            const Positioned(
                left: 16,
                top: 9,
                child: Text("Total amount", style:
                TextStyle(fontSize: 14, color: Colors.grey),)
            ),
            Positioned(
              right: 16,
              top: 9,
              child: Text("$totalAmount\$", style: Theme.of(context).textTheme.bodyMedium,),
            ),
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: SizedBox(
                width: 100.w,
                height: 48,
                child: ElevatedButton(
                    onPressed: (){
                      customSnackBar(context, 'Congratulation!');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: const Color(0xFF2136BE),
                    ),
                    child: const Text("CHECK OUT")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
