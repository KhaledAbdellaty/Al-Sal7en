part of 'surah_cubit.dart';

@immutable
class SurahState {
  final List<SurahData> surahData;
  final List<AyahData> ayahsData;
  final SurahData surah;
  final int index;
  final String pageNo;
  const SurahState(
      {this.surahData = const [],
      this.ayahsData = const [],
      this.index = 0,
      this.pageNo = '',
      this.surah = const SurahData(
        ayahData: [],
        name: '',
        nameInEnglish: '',
        number: 0,
        englishNameTranslation: '',
        revelationType: '',
      )});
  SurahState copyWith({
    List<SurahData>? surahData,
    List<AyahData>? ayahsData,
    int? index,
    String? pageNo,
    SurahData? surah,
  }) {
    return SurahState(
      surahData: surahData ?? this.surahData,
      ayahsData: ayahsData ?? this.ayahsData,
      index: index ?? this.index,
      pageNo: pageNo ?? this.pageNo,
      surah: surah ?? this.surah,
    );
  }
}
