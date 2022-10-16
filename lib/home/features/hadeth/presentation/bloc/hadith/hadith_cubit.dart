
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/error/massaege_failure.dart';
import '../../../domain/entites/hadith.dart';
import '../../../domain/use_cases/get_hadith_use_cuse.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final GetHadithUseCase getHadithUseCase;
  List<HadithChapterInfo> datawithPage = [];
  HadithCubit({required this.getHadithUseCase}) : super(HadithInitial());

  PageController controller = PageController();
  late final String bookSulg;
  late final String chapterNumber;



  getHadith({
    required String BookSlug,
    required String chapterNumber,
    int? current_page,
  }) async {
    emit(HadithLodingState());
    final hadithOrFalir = await getHadithUseCase.getHadithUseCase(
        BookSlug: BookSlug,
        chapterNumber: chapterNumber,
        current_page: current_page);
    hadithOrFalir.fold((faliure) {
      if (faliure is ServerFailure) {
        return emit(HadithErrorState(errorMassege: massaeFailure(faliure)));
      } else {
        return emit(HadithNoDateState());
      }
    }, (data) {
      datawithPage.add(data);
      return emit(HadithDoneState(hadithChapterInfo: datawithPage));
    });
   
  }
}
