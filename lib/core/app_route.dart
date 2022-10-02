import 'package:flutter/material.dart';
import 'package:untitled/core/strings/routes.dart';
import 'package:untitled/home/features/quran_kareem/presentation/quran.dart';
import 'package:untitled/home/features/quran_kareem/presentation/screens/layout_screen.dart';
import 'package:untitled/home/presentation/screens/home_screen.dart';


class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case quranKareemScreen:
        return MaterialPageRoute(
          builder: (context) => QuranKareemScreen(),
        );
      // ignore: no_duplicate_case_values
      case surahScreen:
        final int pageNo = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => SurahScreen(
            pageNo: pageNo,
          ),
        );
    }
  }
}
