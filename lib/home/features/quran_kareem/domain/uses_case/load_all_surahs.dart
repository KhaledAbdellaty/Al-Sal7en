import 'package:untitled/home/features/quran_kareem/data/repositories/surah_repo.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/surah.dart';

class LoadAllSurahsUseCase {
  
  Future<List<SurahData>> call() async {
    return await SurahsRepoImpl.instance.loadAllSurahs();
  }
}
