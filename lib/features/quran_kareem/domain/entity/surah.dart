import 'package:untitled/features/quran_kareem/data/models/ayah_model.dart';

class SurahData {
  String name, nameInEnglish, englishNameTranslation, revelationType;
  List<AyahDataModel> ayahData;
  int number;
  SurahData({
    required this.name,
    required this.nameInEnglish,
    required this.revelationType,
    required this.englishNameTranslation,
    required this.ayahData,
    required this.number,
  });
}
