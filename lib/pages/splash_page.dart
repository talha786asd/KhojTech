import 'dart:async';

import 'package:flutter/material.dart';
import 'package:khoj_tech/pages/login_page.dart';
import 'package:khoj_tech/widgets/bottom_nav_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? data1;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString('userEmail');
    setState(() {
      data1 = data;
    });
  }

  @override
  void initState() {
    checkLogin().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => data1 == null ? LoginPage() : BottomNavBarWidget())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * .7,
          ),
        ),
      ),
    );
  }
}
