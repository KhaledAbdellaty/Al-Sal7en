import 'package:untitled/home/features/quran_kareem/domain/entity/surah.dart';

abstract class SurahsRepo {
  Future<List<SurahData>> loadAllSurahs();
}
