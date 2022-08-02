import 'package:flutter/material.dart';
import 'package:khoj_tech/pages/product_page.dart';
import 'package:khoj_tech/pages/splash_page.dart';
import 'package:khoj_tech/provider/cart_provider.dart';
import 'package:khoj_tech/provider/products_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          child: ProductPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khoj Tech',
        theme: ThemeData(
          fontFamily: 'Avenir',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
