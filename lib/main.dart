import 'package:flutter/material.dart';
import 'package:flutter_app_001/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app 001',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
      },
    );
  }
}
