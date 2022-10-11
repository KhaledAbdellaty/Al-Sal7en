import 'package:equatable/equatable.dart';

class HadithChapterInfo extends Equatable {
  final  HadithChapterData hadiths;

  HadithChapterInfo(this.hadiths);
  @override
  List<Object?> get props => [hadiths];
}

class HadithChapterData extends Equatable {
  final int currentPage;
  final int lastPage;
  final List<HadithData> data;

  HadithChapterData(
      {required this.currentPage, required this.lastPage, required this.data});

  @override
  List<Object?> get props => [
        currentPage,
        lastPage,
        data,
      ];
}

class HadithData extends Equatable {
  final String? hadithEnglish;
  final String hadithArabic;

  HadithData({this.hadithEnglish, required this.hadithArabic});
  @override
  List<Object?> get props => [hadithArabic, hadithEnglish];
}
