
import 'package:flutter/material.dart';
import 'package:untitled/app.dart';
import 'injection_container.dart' as di;

void main()async {
  await di.inti();

  runApp( MyApp());
}


