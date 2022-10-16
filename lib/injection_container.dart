import 'package:get_it/get_it.dart';
import 'package:untitled/features/azkar/data/data_source/local_data_source.dart';
import 'package:untitled/features/azkar/data/repositories/azkar_repo_imp.dart';
import 'package:untitled/features/azkar/domain/repositories/azkar_repo.dart';
import 'package:untitled/features/azkar/domain/uses_case/azkar_use_case.dart';
import 'package:untitled/features/azkar/presentaion/cubit/azkar_cubit.dart';

final sl = GetIt.instance;

Future<void> inti() async{

//bloc
sl.registerFactory(() => AzkarCubit(azkarUseCase: sl()));


// usecase
sl.registerLazySingleton(() => AzkarUseCase(sl()));

//repository
sl.registerLazySingleton<AzkarRepo>(() => AzkarRepoImp(sl()));

//data source
sl.registerLazySingleton<AzkarDataSource>(() => AzkarLocalData());
}