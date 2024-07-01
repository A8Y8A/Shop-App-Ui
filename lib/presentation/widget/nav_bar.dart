import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:quiz2/core/utils/color_manager.dart';
import 'package:quiz2/presentation/screen/categories_page.dart';
import 'package:quiz2/presentation/screen/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Category(),
    HomePage(),
    HomePage(),
    // CategoriesPage(),
    // FavoritesPage(),
    // MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(Icons.home, color: ColorManager.offercolor),
          Icon(Icons.grid_view, color: ColorManager.offercolor),
          Icon(Icons.favorite, color: ColorManager.offercolor),
          Icon(Icons.more_horiz, color: ColorManager.offercolor),
        ],
        inactiveIcons: [
          Text("Home"),
          Text("Categories"),
          Text("Favourite"),
          Text("More"),
        ],
        circleColor: Colors.black,
        color: Colors.white,
        height: 80,
        circleWidth: 60,
        activeIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        shadowColor: ColorManager.lightGrey,
        elevation: 10,
      ),
    );
  }
}
