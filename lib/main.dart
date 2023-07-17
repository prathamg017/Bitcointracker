import 'package:bitcoin_tracker/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin_Tracker',
      debugShowCheckedModeBanner: false,
      home: homescreen(),
    );
  }
}
