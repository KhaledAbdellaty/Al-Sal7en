part of 'surah_cubit.dart';

enum BookMarkStatus {
  none,
  add,
  remove,
}

@immutable
class SurahState {
  final bool isBookMarked;
  final List<SurahData> surahData;
  final List<AyahData> ayahsData;
  final List<AyahData> ayahsBookMarksList;
  final SurahData surah;
  final int index;
  final String pageNo;
  final BookMarkStatus bookMarkStatus;

  const SurahState(
      {this.surahData = const [],
      this.ayahsData = const [],
      this.ayahsBookMarksList = const [],
      this.index = 0,
      this.pageNo = '',
      this.bookMarkStatus = BookMarkStatus.none,
      this.isBookMarked = false,
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
    final List<AyahData>? ayahsBookMarksList,
    int? index,
    String? pageNo,
    SurahData? surah,
    BookMarkStatus? bookMarkStatus,
   bool? isBookMarked,

  }) {
    return SurahState(
      surahData: surahData ?? this.surahData,
      ayahsData: ayahsData ?? this.ayahsData,
      ayahsBookMarksList: ayahsBookMarksList ?? this.ayahsBookMarksList,
      index: index ?? this.index,
      pageNo: pageNo ?? this.pageNo,
      surah: surah ?? this.surah,
      bookMarkStatus: bookMarkStatus ?? this.bookMarkStatus,
      isBookMarked:  isBookMarked ?? this.isBookMarked
    );
  }
}
