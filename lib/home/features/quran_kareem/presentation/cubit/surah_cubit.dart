import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/home/features/quran_kareem/data/models/surah_model.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/surah.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/add_ayah_bookmark.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/get_all_bookmarks.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_all_surahs.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/load_surah_by_page.dart';
import 'package:untitled/home/features/quran_kareem/domain/uses_case/remove_ayah_bookmark.dart';
import '../../data/models/ayah_model.dart';
import '../../domain/entity/ayah.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final LoadAllSurahsUseCase loadAllSurahsUseCase;
  final LoadSurahByPageUseCase loadSurahByPageUseCase;
  final GetAllBookMarksUseCase getAllBookMarksUseCase;
  final AddAyahToBookMarkUseCase addAyahToBookMarkUseCase;
  final RemoveAyahFromBookMarkUseCase removeAyahFromBookMarkUseCase;

  SurahCubit({
    required this.loadAllSurahsUseCase,
    required this.loadSurahByPageUseCase,
    required this.getAllBookMarksUseCase,
    required this.addAyahToBookMarkUseCase,
    required this.removeAyahFromBookMarkUseCase,
  }) : super(SurahState());
  final List<AyahDataModel> ayahs = [];

  loadAllSurahs() async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    await loadAllSurahsUseCase().then((value) {
      emit(state.copyWith(
          surahData: value, loadingStatus: LoadingStatus.loaded));
      for (var s in value) {
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

  loadSurahSeacrched({required String surahName}) async {
    final surahs = await loadAllSurahsUseCase();
    surahs.removeWhere(
        (surah) => !surah.name.toLowerCase().contains(surahName.toLowerCase()));

    emit(state.copyWith(surahData: surahs));
  }

  getAllBookMarks() async {
    final list = await getAllBookMarksUseCase();
    emit(state.copyWith(ayahsBookMarksList: list));
  }

  addToBookMark({required AyahData ayahData}) async {
    final AyahDataModel ayahDataModel = AyahDataModel(
        page: ayahData.page,
        text: ayahData.text,
        numberOfSurah: ayahData.numberOfSurah,
        juz: ayahData.juz,
        manzil: ayahData.manzil,
        hizbQuarter: ayahData.hizbQuarter);
    await addAyahToBookMarkUseCase(ayahDataModel);
    emit(state.copyWith(bookMarkStatus: BookMarkStatus.add));
    getAllBookMarks();
  }

  removeFromBookMark({required String ayahText}) async {
    await removeAyahFromBookMarkUseCase(ayahText);
    emit(state.copyWith(bookMarkStatus: BookMarkStatus.remove));
    getAllBookMarks();
  }

  handleToBookMark(String ss) {
    emit(state.copyWith(
      isBookMarked: true,
    ));
  }
}
