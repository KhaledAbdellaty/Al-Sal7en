import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final String chapterNumber, chapterEnglish, chapterArabic, bookSlug;

  Chapter({
    required this.chapterNumber,
    required this.chapterEnglish,
    required this.chapterArabic,
    required this.bookSlug,
  });

  @override
  List<Object?> get props =>
      [chapterNumber, chapterEnglish, chapterArabic, bookSlug];
}

class Chapters extends Equatable {

     final List<Chapter> chapters;

  Chapters({required this.chapters});

  @override
 
  List<Object?> get props =>[chapters];

}
