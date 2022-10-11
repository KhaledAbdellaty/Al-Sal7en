
import '../../domain/entites/chapter.dart';

class ChaptersModel extends Chapters {
  ChaptersModel({required super.chapters});

  factory ChaptersModel.fromJson(Map<String, dynamic> json) {
    return ChaptersModel(
        chapters: List<ChapterModel>.from(
            json["chapters"].map((e) => ChapterModel.fromjson(e))));
  }
}

class ChapterModel extends Chapter {
  ChapterModel(
      {required super.chapterNumber,
      required super.chapterEnglish,
      required super.chapterArabic,
      required super.bookSlug});
  factory ChapterModel.fromjson(Map<String, dynamic> json) {
    return ChapterModel(
        chapterNumber: json["chapterNumber"],
        chapterEnglish: json["chapterEnglish"],
        chapterArabic: json["chapterArabic"],
        bookSlug: json["bookSlug"]);
  }
}
