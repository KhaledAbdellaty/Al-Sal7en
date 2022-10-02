import 'package:get_it/get_it.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/add_ayah_bookmark.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/get_all_bookmarks.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_all_surahs.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_surah_by_page.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/remove_ayah_bookmark.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:untitled/home/presentation/blocs/cubit/app_bar_cubit.dart';

final inj = GetIt.instance;
Future<void> init() async {
  //Blocs
  inj.registerFactory(() => AppBarCubit());
  inj.registerFactory(() => SurahCubit(
        loadAllSurahsUseCase: inj(),
        loadSurahByPageUseCase: inj(),
        addAyahToBookMarkUseCase: inj(),
        removeAyahFromBookMarkUseCase: inj(),
        getAllBookMarksUseCase: inj(),
      ));

  //Uses Cases
  inj.registerLazySingleton(() => LoadAllSurahsUseCase());
  inj.registerLazySingleton(() => LoadSurahByPageUseCase());
  inj.registerLazySingleton(() => AddAyahToBookMarkUseCase());
  inj.registerLazySingleton(() => RemoveAyahFromBookMarkUseCase());
  inj.registerLazySingleton(() => GetAllBookMarksUseCase());
}
