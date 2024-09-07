import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class ProductListBadScreen extends StatefulWidget {
  final String argument;
  const ProductListBadScreen({
    super.key,
    required this.argument,
  });

  @override
  State<ProductListBadScreen> createState() => _ProductListBadScreenState();
}

class _ProductListBadScreenState extends State<ProductListBadScreen> {
  final List<Product> _products = [
    Product('Apple', 1.0),
    Product('Banana', 0.5),
    Product('Orange', 0.7),
  ];

  final List<Product> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ProductListBadScreen rebuilt');
    int itemCount = _cartItems.length;
    double totalPrice = _cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.argument),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_products[index].name),
                  subtitle:
                      Text('\$${_products[index].price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () => _addToCart(_products[index]),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items in cart: $itemCount'),
                Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
