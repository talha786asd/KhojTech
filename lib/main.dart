import 'package:flutter/material.dart';
import 'package:khoj_tech/widgets/bottom_nav_bar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khoj Tech',
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: const BottomNavBarWidget(),
    );
  }
}
