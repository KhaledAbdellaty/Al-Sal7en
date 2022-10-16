<<<<<<< HEAD
=======
import 'dart:async';
>>>>>>> b2e2a6c1de38201dafea3382e88ef8df16779286

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/app.dart';
<<<<<<< HEAD
import 'injection_container.dart' as di;

void main()async {
  await di.inti();

  runApp( MyApp());
=======
import './core/injection_container.dart' as injection;
import 'core/app_route.dart';
import 'core/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injection.init();
  BlocOverrides.runZoned(
      () => runApp(MyApp(
            appRoute: AppRoute(),
          )),
      blocObserver: MyBlocObserver());


>>>>>>> b2e2a6c1de38201dafea3382e88ef8df16779286
}
