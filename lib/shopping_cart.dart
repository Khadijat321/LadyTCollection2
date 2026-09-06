import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'quantity': 0, 'price': 300000},
    {'name': 'Phone', 'quantity': 0, 'price': 200000},
    {'name': 'Tv', 'quantity': 0, 'price': 500000},
  ];

  void addToCart(int index) {
    setState(() {
      products[index]['quantity']++;
    });
  }

  void removeFromCart(int index) {
    if (products[index]['quantity'] > 0) {
      setState(() {
        products[index]['quantity']--;
      });
    }
  }

  int get totalItem {
    int total = 0;
    for (var product in products) {
      total += product['quantity'] as int;
    }

    return total;
  }

  int get totalPrice {
    int total = 0;
    for (var product in products) {
      total += product['price'] * product['quantity'] as int;
    }

    return total;
  }

  void clearCart() {
    for (var product in products) {
      setState(() {
        product['quantity'] = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: Text('Cart: $totalItem'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text(product['price'].toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            removeFromCart(index);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(product['quantity'].toString()),
                        IconButton(
                          onPressed: () {
                            addToCart(index);
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                Text('Total Item: $totalItem'),
                Text('Total Price: $totalPrice'),
                ElevatedButton(onPressed: clearCart, child: Text('Clear Cart')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
