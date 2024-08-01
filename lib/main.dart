import 'package:flutter/material.dart';
import 'package:gelir_tablosu/models/items_data.dart';
import 'package:gelir_tablosu/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ItemData>(create: (BuildContext context) => ItemData(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white, // Tema ana rengi belirler
          primary: Colors.blue,
        ),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


