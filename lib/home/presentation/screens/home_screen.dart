import 'package:flutter/material.dart';

import '../widgets/menu_gridview_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  double width = 129;
  double hieght = 127;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 120,
          left: 50,
          child: MenuGridViewWidget(),
        )
      ]),
    );
  }
}
