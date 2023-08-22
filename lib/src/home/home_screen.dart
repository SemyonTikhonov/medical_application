import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Путь к логотипу приложения
              height: 30, // Высота логотипа
            ),
            SizedBox(width: 8), // Отступ между логотипом и текстом
            const Text(
              'Товары',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Действие при нажатии на иконку уведомлений
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Действие при нажатии на иконку корзины
            },
          ),
        ],
      ),
      body: Center(
        child: Text('AllStom'),
      ),
    );
  }
}
