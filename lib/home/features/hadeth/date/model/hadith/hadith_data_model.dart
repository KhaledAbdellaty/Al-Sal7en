import '../../../domen/entites/hadith.dart';

class HadithDataModel extends HadithData {
  HadithDataModel({
     super.hadithEnglish,
    required super.hadithArabic,
  });
  factory HadithDataModel.fromJson(Map<String, dynamic> json) {
    return HadithDataModel(hadithArabic: json["hadithArabic"]);
  }
}
