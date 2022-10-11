
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entites/search_hadith.dart';
import '../../../domain/use_cases/get_hadith_locl_use_case.dart';
import '../../../domain/use_cases/save_hadith_use_case.dart';

part 'save_hadith_state.dart';

class SaveHadithCubit extends Cubit<SaveHadithState> {
  SaveHadithCubit(
      {required this.getHadithLocalUseCase, required this.saveHadithUseCase})
      : super(SaveHadithInitial());
  final SaveHadithUseCase saveHadithUseCase;
  final GetHadithLocalUseCase getHadithLocalUseCase;

  saveHadith(SearchHadith searchHadith) async {
    final stat = await saveHadithUseCase.saveHadithUseCase(searchHadith);
    stat.fold((failur) => emit(SaveHadithErorrState()), (done) => Unit);
  }

  gethadithDB() async {
    emit(SaveHadithLodingState());
    final data = await getHadithLocalUseCase.getHadithLocal();
    data.fold((l) => emit(SaveHadithErorrState()), (r) {
      print(r[5]);
      emit(SaveHadithDoneState(hadiths: r));
    });
  }
}
