import 'package:untitled/home/features/quran_kareem/data/models/ayah_model.dart';

class SurahData {
 final  String name, nameInEnglish, englishNameTranslation, revelationType;
  final List<AyahDataModel> ayahData;
  final int number;
  const SurahData({
    required this.name,
    required this.nameInEnglish,
    required this.revelationType,
    required this.englishNameTranslation,
    required this.ayahData,
    required this.number,
  });
}
