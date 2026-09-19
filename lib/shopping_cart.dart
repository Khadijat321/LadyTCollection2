import 'package:flutter/material.dart';
import 'package:flutterproject2_app/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutterproject2_app/provider/change_value_price.dart';
import 'package:provider/provider.dart';

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
              itemBuilder: (_, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text(
                      product['name'] == 'Laptop'
                          ? context.watch<ChangeValuePrice>().price.toString()
                          : product['price'].toString(),
                    ),
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
                            context.read<ChangeValuePrice>().setLaptopPrice(
                              product['quantity'],
                            );
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

class Structure extends StatefulWidget {
  const Structure({super.key});

  @override
  State<Structure> createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [SettingScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
