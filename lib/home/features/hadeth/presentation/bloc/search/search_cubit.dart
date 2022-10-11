
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entites/search_hadith.dart';
import '../../../domain/use_cases/searth_hadith.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchHadithUseCases}) : super(SearchInitial());
  SearchHadithUseCases searchHadithUseCases;

  int page = 1;
  List<SearchHadith> date = [];

  TextEditingController vlaueSearch = TextEditingController();
  final controller = ScrollController();

  upController() {
    controller.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  cont() {
    controller.addListener(
      () {
        if (controller.position.maxScrollExtent == controller.offset) {
          gitValueSearch(pageNumper: page++);
        }
      },
    );
  }

  gitValueSearch({int? pageNumper}) async {
    print("run bloc event ==");
    emit(SearchLodingState());
    final date = await searchHadithUseCases.call(
      vlaueSearch.text,
      pageNumper == null ? 1 : pageNumper,
    );

    date.fold(
        (failur) => emit(SearchErrorState(massegeError: massaeFailure(failur))),
        (date) {
      this.date.addAll(date);
      emit(SearchDoneState(date: this.date));
    });
  }
}
