import 'package:flutter/material.dart';
import 'package:travels/app_drawer.dart';
import 'package:travels/categories_screen.dart';
import 'package:travels/favorit_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var selectedIndex = 0;
  void selectItem(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Map> _screen = [
    {
      'screen': CategoriesScreen(),
      'title': "Categories",
    },
    {
      'screen': FavoritsScreen(),
      'title': "Favorit",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[selectedIndex]['title']),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _screen[selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectItem,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorit"),
          ]),
    );
  }
}
