import 'package:electric_car_app/screens/into.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BYD Seal",
      theme: ThemeData(
        scaffoldBackgroundColor:Color(0xff111111),
      ),
      home: Into(),
    );
  }
}