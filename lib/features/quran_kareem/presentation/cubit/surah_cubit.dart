import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/features/quran_kareem/domain/entity/surah.dart';
import 'package:untitled/features/quran_kareem/domain/uses_case/load_surah.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final LoadSurahUseCase loadSurahUseCase;
  SurahCubit({required this.loadSurahUseCase}) : super(SurahInitial());

  loadSurah() async {
    await loadSurahUseCase().then((value) {
      emit(SurahLoading());
      emit(SurahLoaded(surahData: value));
    });
  }
}
