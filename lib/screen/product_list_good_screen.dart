import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  const Product(this.name, this.price);
}

class ProductListGoodScreen extends StatefulWidget {
  final String argument;
  const ProductListGoodScreen({
    super.key,
    required this.argument,
  });

  @override
  State<ProductListGoodScreen> createState() => _ProductListGoodScreenState();
}

class _ProductListGoodScreenState extends State<ProductListGoodScreen> {
  final List<Product> _products = const [
    Product('Apple', 1.0),
    Product('Banana', 0.5),
    Product('Orange', 0.7),
  ];

  final GlobalKey<_CartSummaryState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('ProductListGoodScreen rebuilt');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.argument),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: ProductList(
              products: _products,
              onAddToCart: (product) {
                _key.currentState?.addToCart(product);
              },
            ),
          ),
          CartSummary(key: _key),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;

  const ProductList(
      {super.key, required this.products, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    print('ProductList rebuilt');
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(
          key: ValueKey(products[index].name),
          product: products[index],
          onAddToCart: onAddToCart,
        );
      },
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const ProductListItem(
      {super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    print('ProductListItem rebuilt: ${product.name}');
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: () => onAddToCart(product),
      ),
    );
  }
}

class CartSummary extends StatefulWidget {
  const CartSummary({super.key});

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  final List<Product> cartItems = [];

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('CartSummary rebuilt');
    int itemCount = cartItems.length;
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Items in cart: $itemCount'),
          Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
