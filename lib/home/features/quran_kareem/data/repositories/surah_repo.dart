import 'package:untitled/home/features/quran_kareem/data/models/surah_model.dart';
import 'package:untitled/home/features/quran_kareem/data/data_resources/remote_data_source.dart';

class SurahRepoImpl {
  SurahRepoImpl._();

  static final SurahRepoImpl instance = SurahRepoImpl._();
  Future<List<SurahDataModel>> loadSurah() async {
    try {
    
      return await QuranRemoteDataSourceImpl.instance.loadSurah();
    } catch (e) {
      rethrow;
    }
  }
}
