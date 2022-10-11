import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/injection_container.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:untitled/home/features/quran_kareem/presentation/taps/all_quran/all_quran_screen.dart';
import 'package:untitled/home/features/quran_kareem/presentation/taps/book_markes/book_markes_screen.dart';
import 'package:untitled/home/presentation/blocs/cubit/app_bar_cubit.dart';

import '../../../../../core/widgets/my_custom_app_bar.dart';

class QuranKareemScreen extends StatelessWidget {
  const QuranKareemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarCubit>(
          create: (context) => AppBarCubit(),
        ),
        BlocProvider(
          create: (context) => inj<SurahCubit>()..loadAllSurahs(),
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: MyCustomAppBar(),
          body: TabBarView(children: [
            AllQuran(),
            Center(
              child: Text('Second Screen'),
            ),
            BookMarksScreen(),
          ]),
        ),
      ),
    );
  }
}
