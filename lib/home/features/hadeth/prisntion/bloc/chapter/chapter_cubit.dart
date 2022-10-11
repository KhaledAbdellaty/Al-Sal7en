import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/massaege_failure.dart';
import '../../../domen/entites/chapter.dart';
import '../../../domen/use_cases/get_chaptir_use_case.dart';

part 'chapter_state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  final GetChaptirUseCase getChaptirUseCase;
  ChapterCubit( {required this.getChaptirUseCase,}) : super(ChapterInitial());


  
   getchaptar(String bookName) async {
    emit(LodingState());
    final chapter = await getChaptirUseCase.call(bookName);
    chapter.fold(
      (failure) => emit(ErrorState( massaeFailure(failure))),
      (chapter) => emit(DoneState(chapter)),
    );
  }
}
