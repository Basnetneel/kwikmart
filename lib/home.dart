
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:kwik_mart/drawer.dart';
import 'package:kwik_mart/pages/cart.dart';
import 'package:kwik_mart/pages/explore.dart';
import 'package:kwik_mart/pages/search.dart';
import 'package:kwik_mart/prof2/profile_screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [
     ExplorePage(),
     SearchPage(title: 'Search',),
     CartPage(),
     ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: PageView(
        onPageChanged: (index) => setState(() { _selectedPage = index; }),
        controller: _pageController,
        children: [
          ...pages
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: const Color.fromARGB(255, 255, 251, 251),
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_outlined, size: 23),
            title: const Text('Home'),
            activeColor: Colors.orange,
            inactiveColor: Colors.black,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search, size: 23),
            title: const Text('Search'),
             activeColor: Colors.orange,
            inactiveColor: Colors.black,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.shopping_bag_outlined, size: 23),
            title: const Text('Cart'),
             activeColor: Colors.orange,
            inactiveColor: Colors.black,
          ),
          FlashyTabBarItem(
            icon:const  Icon(Icons.account_circle_outlined, size: 23,),
            title:const  Text('Profile'),
             activeColor: Colors.orange,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
