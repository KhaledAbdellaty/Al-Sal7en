import 'package:flutter/material.dart';
import 'package:untitled/core/app_route.dart';
import 'package:untitled/home/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
      // home: MyWidget(),
    );
  }
}
