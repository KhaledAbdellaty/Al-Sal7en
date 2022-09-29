import 'package:flutter/material.dart';
import 'package:untitled/home/presentation/screens/home_screen.dart';
//import 'package:untitled/test_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: MyWidget(),
    );
  }
}
