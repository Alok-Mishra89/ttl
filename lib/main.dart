import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Views/cart_page_view.dart';
import 'Views/home_page_view.dart';
import 'Views/login_page_view.dart';
import 'Views/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreenView(),
          '/homepage': (context) => const HomePageView(),
          '/cartpage': (context) => CartPageView(),
          '/loginpage': (context) => const LoginPageView(),
        },
      ),
    );
  }
}
