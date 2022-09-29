import 'package:untitled/home/features/quran_kareem/data/repositories/surah_repo.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/surah.dart';

class LoadSurahUseCase {
  Future<List<SurahData>> call() async {
    return await SurahRepoImpl.instance.loadSurah();
  }
}
