import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/azkar/presentaion/cubit/azkar_cubit.dart';
import 'package:untitled/features/azkar/presentaion/screen/azkar_category_screen.dart';
import 'package:untitled/features/home/presentation/screens/home_screen.dart';
import 'injection_container.dart' as di;




class MyApp extends StatelessWidget {
   MyApp({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>di.sl<AzkarCubit>()..getAzkar()),
    ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: AzkarCategoryScreen(),
      ),
=======
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/core/app_route.dart';

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
      localizationsDelegates: const [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      // home: MyWidget(),
>>>>>>> b2e2a6c1de38201dafea3382e88ef8df16779286
    );
  }
}
