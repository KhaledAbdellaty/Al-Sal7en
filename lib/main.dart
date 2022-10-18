
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/app.dart';
import 'package:untitled/core/app_route.dart';


import './core/injection_container.dart' as injection;
import 'core/bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injection.init();
  BlocOverrides.runZoned(
      () => runApp(MyApp(
            appRoute: AppRoute(),
          )),
      blocObserver: MyBlocObserver());


}
