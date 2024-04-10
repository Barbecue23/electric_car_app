import 'dart:async';

import 'package:flutter/material.dart';
import 'package:electric_car_app/screens/home.dart';

void main() {
  runApp(Into());
}

class Into extends StatefulWidget {
  @override
  _IntoState createState() => _IntoState();
}

class _IntoState extends State<Into> {
  bool _isLogoExpanded = false;

  @override
  void initState() {
    super.initState();
    // เริ่มต้นการขยายโลโก้ในช่วงเวลาหนึ่ง
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLogoExpanded = true;
      });
    });
    // นำทางไปยังหน้าถัดไปหลังจากช่วงเวลาหนึ่ง
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BYD Seal",
      home: Scaffold(
        backgroundColor: Colors.black, // ตั้งค่าพื้นหลังเป็นสีดำ
        body: Center(
          child: AnimatedOpacity(
            opacity: _isLogoExpanded ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _isLogoExpanded ? 400.0 : 100.0,
              height: _isLogoExpanded ? 400.0 : 100.0,
              child: Image.asset("assets/BYDlogo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
