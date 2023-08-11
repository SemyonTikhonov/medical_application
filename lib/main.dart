import 'package:flutter/material.dart';
import 'package:medical_application/src/home/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final List<Widget> children = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
}


}
