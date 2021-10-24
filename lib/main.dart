import 'package:flutter/material.dart';
import 'Pages/homePage.dart';
import 'assets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZODIAC',
      theme: ThemeData(
        bottomAppBarColor: blue,
        appBarTheme: const AppBarTheme(color: blue),
        backgroundColor: blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: white),
      ),
      home: const HomePage(),
    );
  }
}
