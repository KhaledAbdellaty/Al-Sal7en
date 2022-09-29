import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SvgPicture.asset(
          'assets/images/Asset 1.svg',
          height: 500,
        ),
      ),
    );
  }
}
