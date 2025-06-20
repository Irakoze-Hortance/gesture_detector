import  'package:flutter/material.dart';
import 'package:gesture_detector/screens/gesture_detector.dart';


 void main() {
   runApp(
      MyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GestureDetectorDemoPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    );
  }
}
