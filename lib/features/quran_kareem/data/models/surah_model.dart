import 'package:untitled/features/quran_kareem/data/models/ayah_model.dart';
import 'package:untitled/features/quran_kareem/domain/entity/surah.dart';

class SurahDataModel extends SurahData {
  SurahDataModel({
    required super.name,
    required super.number,
    required super.nameInEnglish,
    required super.ayahData,
    required super.englishNameTranslation,
    required super.revelationType,
  });

  factory SurahDataModel.fromJson(Map<String, dynamic> json) {

    final List<dynamic> ayahFromJson = json['ayahs'];
    final List<AyahDataModel> ayahData = [];
    ayahFromJson.forEach(
      (element) => ayahData.add(AyahDataModel.fromJson(element)),
    );

    return SurahDataModel(
        name: json['name'],
        nameInEnglish: json['englishName'],
        number: json['number'],
        ayahData: ayahData,
        englishNameTranslation: json['englishNameTranslation'],
        revelationType: json['revelationType']);
  }

 

}
