import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/injection_container.dart';
import 'package:untitled/core/strings/routes.dart';
import 'package:untitled/home/features/hadeth/presentation/bloc/book/book_cubit.dart';
import 'package:untitled/home/features/hadeth/presentation/ui/Screens/chapter_screen.dart';
import 'package:untitled/home/features/hadeth/presentation/ui/Screens/hadith_home_screen.dart';
import 'package:untitled/home/features/hadeth/presentation/ui/Screens/hadith_screen.dart';
import 'package:untitled/home/features/hadeth/presentation/ui/Screens/seach_screen.dart';
import 'package:untitled/home/features/quran_kareem/presentation/quran.dart';
import 'package:untitled/home/features/quran_kareem/presentation/screens/layout_screen.dart';
import 'package:untitled/home/presentation/screens/home_screen.dart';

import '../home/features/hadeth/presentation/bloc/chapter/chapter_cubit.dart';
import '../home/features/hadeth/presentation/bloc/hadith/hadith_cubit.dart';
import '../home/features/hadeth/presentation/bloc/search/search_cubit.dart';

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
      case hadithHomeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => inj<BookCubit>()..getBook(),
            child: HadithHomeScreen(),
          ),
        );
      case chapterScreen:
        final Map<String, dynamic> chapter =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                inj<ChapterCubit>()..getchaptar(chapter.values.elementAt(1)),
            child: ChapterScreen(
              bookName: chapter.values.elementAt(0),
            ),
          ),
        );

      case searchHadithScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => inj<SearchCubit>(),
            child: SearchHadithScreen(),
          ),
        );

      case hadithDetailsScreen:
        final Map<String, dynamic> hadith =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => inj<HadithCubit>()
              ..datawithPage.clear()
              ..getHadith(
                  BookSlug: hadith.values.elementAt(1),
                  chapterNumber: hadith.values.elementAt(2)),
            child: HadithScreen(
              chapter: hadith.values.elementAt(0),
              bookSlug: hadith.values.elementAt(1),
              chapterNumber: hadith.values.elementAt(2),
            ),
          ),
        );
    }
  }
}
