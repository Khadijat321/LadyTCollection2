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
  

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ChangeValuePrice>();
    final readCart = context.read<ChangeValuePrice>()
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: Text('Cart: ${cart.totalItem.toString()}'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final product = cart.products[index];
                final int quantity = product['quantity'] as int; 
                final int price = product['price'] as int; 
                final int totalPrice = price * quantity;

                return Card(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text(
                      price.toString(),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            readCart.removeFromCart(index);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(product['quantity'].toString()),
                        IconButton(
                          onPressed: () {
                           readCart.addToCart(index);
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
                ElevatedButton(onPressed: readCart.clearCart, child: Text('Clear Cart')),
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
