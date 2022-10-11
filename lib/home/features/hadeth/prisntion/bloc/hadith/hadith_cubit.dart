import 'package:aqra_application/core/error/failures.dart';
import 'package:aqra_application/core/error/massaege_failure.dart';
import 'package:aqra_application/hadeth/domen/entites/hadith.dart';
import 'package:aqra_application/hadeth/domen/use_cases/get_hadith_use_cuse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final GetHadithUseCase getHadithUseCase;
  List<HadithChapterInfo> datawithPage = [];
  HadithCubit({required this.getHadithUseCase}) : super(HadithInitial());

  PageController controller = PageController();
  late final String bookSulg;
  late final String chapterNumber;

  getconyroller() {
    print("run controler");

    // controller.addListener(() {
    //   print("controller");
    //   if (controller.offset == controller.position.maxScrollExtent) {
    //     final int currentPage = datawithPage.last.hadiths.currentPage;
    //     final int lastPage = datawithPage.last.hadiths.lastPage;
    //     if (currentPage <= lastPage) {
    //       getHadith(
    //           BookSlug: bookSulg,
    //           chapterNumber: chapterNumber,
    //           current_page: currentPage);
    //     }
    //   }
    // });
  }

  getHadith({
    required String BookSlug,
    required String chapterNumber,
    int? current_page,
  }) async {
    print("====${datawithPage.length}====");
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
    //getHadith(BookSlug: BookSlug, chapterNumber: chapterNumber,current_page:current_page==null?null:current_page+1);
  }
}
