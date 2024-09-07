import 'package:flutter/material.dart';
import 'package:flutter_performance_view/screen/expensive_list_bad_screen.dart';
import 'package:flutter_performance_view/screen/expensive_list_good_screen.dart';

import 'package:flutter_performance_view/screen/home_screen.dart';
import 'package:flutter_performance_view/screen/product_list_bad_screen.dart';
import 'package:flutter_performance_view/screen/product_list_good_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: const {},
      onGenerateRoute: (settings) {
        if (settings.name == '/1/bad') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ExpensiveListBadScreen(argument: args),
          );
        }
        if (settings.name == '/1/good') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ExpensiveListGoodScreen(argument: args),
          );
        }
        if (settings.name == '/2/bad') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ProductListBadScreen(argument: args),
          );
        }
        if (settings.name == '/2/good') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ProductListGoodScreen(argument: args),
          );
        }
        return null;
      },
    );
  }
}
