import 'package:flutter/material.dart';
import 'package:travels/categories_screen.dart';
import 'package:travels/category_trips_screen.dart';
import 'package:travels/tabs_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}
