import 'package:flutter/material.dart';
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
    );
  }
}
