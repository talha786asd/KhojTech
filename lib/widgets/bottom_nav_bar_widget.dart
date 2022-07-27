import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:khoj_tech/pages/home_page.dart';
import 'package:khoj_tech/widgets/badge.dart';
 

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(
            () => _currentIndex = index,
          );
        },
        children: <Widget>[
          HomePage(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: MediaQuery.of(context).size.height * .09,
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(
            () => _currentIndex = index,
          );
          _pageController!.jumpToPage(
            index,
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Avenir',
              ),
            ),
            icon: const Icon(
              Icons.home,
            ),
            activeColor: const Color(
              0xff292665,
            ),
            inactiveColor: const Color(
              0xff414042,
            ),
          ),
          BottomNavyBarItem(
            title: const Text(
              'Account',
              style: TextStyle(
                fontFamily: 'Avenir',
              ),
            ),
            icon: const Icon(
              Icons.person,
            ),
            activeColor: const Color(
              0xff292665,
            ),
            inactiveColor: const Color(
              0xff414042,
            ),
          ),
          BottomNavyBarItem(
            title: const Text(
              'Cart',
              style: TextStyle(
                fontFamily: 'Avenir',
              ),
            ),
            icon: Badge(child: Icon(Icons.shopping_cart), value: '0'),
              
            activeColor: const Color(
              0xff292665,
            ),
            inactiveColor: const Color(
              0xff414042,
            ),
          ),
        ],
      ),
    );
  }
}
