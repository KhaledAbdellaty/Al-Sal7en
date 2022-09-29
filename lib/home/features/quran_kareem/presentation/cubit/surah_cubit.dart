import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/home/features/quran_kareem/data/models/surah_model.dart';

import 'package:untitled/home/features/quran_kareem/domain/entity/surah.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_surah.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_surah_by_page.dart';

import '../../data/models/ayah_model.dart';
import '../../domain/entity/ayah.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final LoadSurahUseCase loadSurahUseCase;
  final LoadSurahByPageUseCase loadSurahByPageUseCase;

  SurahCubit(
      {required this.loadSurahUseCase, required this.loadSurahByPageUseCase})
      : super(SurahState());
  final List<AyahDataModel> ayahs = [];

  loadSurah() async {
    await loadSurahUseCase().then((value) {
      emit(state.copyWith(surahData: value));
      for (var s in value) {
        //print(s);
        emit(state.copyWith(surah: s));
      }
    });
  }

  loadSurahByPage(int index) async {
    final ss = await loadSurahByPageUseCase(index);
    List<dynamic> ayah = ss['ayahs'];
    var pageNo = ss['number'];
    ayahs.clear();
    ayah.map((e) => ayahs.add(AyahDataModel.fromJson(e))).toList();
    final SurahData surah = SurahDataModel.fromJson2(ss['surahs']);
    emit(state.copyWith(
        ayahsData: ayahs, surah: surah, pageNo: pageNo.toString()));
  }
}
