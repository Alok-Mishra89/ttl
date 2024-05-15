import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_view.dart';

class CartPageView extends StatefulWidget {
  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          List<Products>? cartItems = cartProvider.cartItems;

          // Calculate total amount
          double totalAmount = cartItems.fold(0, (sum, product) => sum + product.price);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20), // Add space between image and text
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8), // Add space between title and other elements
                                Text(
                                  'Price: Rs${product.price.toStringAsFixed(2)}', // Display price
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cartProvider.removeFromCart(product);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Amount: Rs ${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
