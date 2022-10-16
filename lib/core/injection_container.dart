import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/add_ayah_bookmark.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/get_all_bookmarks.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_all_surahs.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_surah_by_page.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/remove_ayah_bookmark.dart';
import 'package:untitled/home/features/quran_kareem/presentation/cubit/surah_cubit.dart';
import 'package:untitled/home/presentation/blocs/cubit/app_bar_cubit.dart';

import '../home/features/asma_alah/data/asma_repo_imp/asma_allah_repo_imp.dart';
import '../home/features/asma_alah/data/data_surc/remot_data_surs.dart';
import '../home/features/asma_alah/domen/asma_repo/asma_allah_repo.dart';
import '../home/features/asma_alah/domen/use_cases/get_asma_allah_use_case.dart';
import '../home/features/asma_alah/prisntion/bloc/asma_allah/asma_allah_cubit.dart';
import '../home/features/hadeth/data/data_resources/remot_date_sorc.dart';
import '../home/features/hadeth/data/hadith_rep_imp/hadith_book_rep_imp.dart';
import '../home/features/hadeth/domain/hadith_rep/hadith_book_rep.dart';
import '../home/features/hadeth/domain/use_cases/get_book_use_case.dart';
import '../home/features/hadeth/domain/use_cases/get_chaptir_use_case.dart';
import '../home/features/hadeth/domain/use_cases/get_hadith_locl_use_case.dart';
import '../home/features/hadeth/domain/use_cases/get_hadith_use_cuse.dart';
import '../home/features/hadeth/domain/use_cases/save_hadith_use_case.dart';
import '../home/features/hadeth/domain/use_cases/searth_hadith.dart';
import '../home/features/hadeth/presentation/bloc/book/book_cubit.dart';
import '../home/features/hadeth/presentation/bloc/chapter/chapter_cubit.dart';
import '../home/features/hadeth/presentation/bloc/hadith/hadith_cubit.dart';
import '../home/features/hadeth/presentation/bloc/save_hadith/save_hadith_cubit.dart';
import '../home/features/hadeth/presentation/bloc/search/search_cubit.dart';
import 'internet_check/network_info.dart';

final inj = GetIt.instance;
Future<void> init() async {

////////Alquran Alkarem ////////////////

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




  ////////hadith & Asma Allah Alhosna ////////////////
  
  ///// bloc //
  inj.registerFactory(() => BookCubit(getHadithBookUse: inj()));
  inj.registerFactory(() => ChapterCubit(getChaptirUseCase: inj()));
  inj.registerFactory(() => HadithCubit(getHadithUseCase: inj()));
  inj.registerFactory(() => SearchCubit(searchHadithUseCases: inj()));
  inj.registerFactory(() => AsmaAllahCubit(getAsmaAllahUseCase: inj()));
 // inj.registerFactory(() =>
  // SaveHadithCubit(saveHadithUseCase: inj(), getHadithLocalUseCase: inj()));
  

  // usecases //
  inj.registerLazySingleton(() => GetBookUseCase(hadithRepo: inj()));
  inj.registerLazySingleton(() => GetChaptirUseCase(hadithBookRepo: inj()));
  inj.registerLazySingleton(() => SearchHadithUseCases(hadithRepo: inj()));
  inj.registerLazySingleton(() => GetHadithUseCase(hadithRepo: inj()));
  inj.registerLazySingleton(() => GetAsmaAllahUseCase(asmaAllahRepo: inj()));
 // inj.registerLazySingleton(() => SaveHadithUseCase(hadithRepo: inj()));
  // inj.registerLazySingleton(() => GetHadithLocalUseCase(hadithRepol: inj()));


  // replsitory //
  inj.registerLazySingleton<HadithRepo>(
      () => HadithRepImp(networkInfo: inj(), remotdateSurse: inj()));

  inj.registerLazySingleton<AsmaAllahRepo>(
      () => AsmaAllahRepoImp(remotahDataSurc: inj()));

// datasource //
  inj.registerLazySingleton<RemotdateSurse>(() => RemotDateSurseWithDio());

  inj.registerLazySingleton<AsmaAllahRemotahDataSurc>(
      () => AsmaAllahRemotdataSurcWithLocl());

  //inj.registerLazySingleton<LocalDataSurc>(() => LocalDataSurcWithSQFLIT());


// Core //
  inj.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(inj()));


// External //

  inj.registerLazySingleton(() => InternetConnectionChecker());
}
