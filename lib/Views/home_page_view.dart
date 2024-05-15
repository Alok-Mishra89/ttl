import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class Products {
  final int id;
  final String title;
  final String image;
  final double price;

  Products({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
}

class CartProvider extends ChangeNotifier {
  List<Products> _cartItems = [];

  List<Products> get cartItems => _cartItems;

  void addToCart(Products product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Products product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}

class _HomePageViewState extends State<HomePageView> {
  List<dynamic> products = [];
  List<String> categories = [];
  String selectedCategory = '';
  bool sortAscending = true;

  void addToCart(BuildContext context, dynamic product) {
    CartProvider cartProvider =
    Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart(
      Products(
        id: product['id'],
        title: product['title'],
        image: product['image'],
        price: product['price'].toDouble(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
    fetchCategories();
  }

  Future<void> fetchProducts() async {
    final response =
    await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      setState(() {
        categories = List<String>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void filterProductsByCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  List<dynamic> getFilteredProducts() {
    if (selectedCategory.isEmpty) {
      return products;
    } else {
      return products
          .where((product) => product['category'] == selectedCategory)
          .toList();
    }
  }

  void sortProducts() {
    setState(() {
      sortAscending = !sortAscending;
      if (sortAscending) {
        products.sort((a, b) => a['price'].compareTo(b['price']));
      } else {
        products.sort((a, b) => b['price'].compareTo(a['price']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: sortProducts,
          icon: const Icon(
            Icons.sort,
            size: 35,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search your product',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map(
                    (category) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      filterProductsByCategory(category);
                    },
                    child: Text(category),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 10 / 15,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
              ),
              itemCount: getFilteredProducts().length,
              itemBuilder: (buildContext, index) {
                final filteredProducts = getFilteredProducts();
                return Column(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            filteredProducts[index]['image'],
                            width: 100,
                            height: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Text(
                              filteredProducts[index]['title'],
                              maxLines: 2,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Rs ${filteredProducts[index]['price']}"),
                              ),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Item added to cart"),
                                    backgroundColor: Colors.green,
                                  ));
                                  addToCart(context, filteredProducts[index]);
                                },
                                icon:
                                const Icon(Icons.add_shopping_cart_rounded),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cartpage');
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
