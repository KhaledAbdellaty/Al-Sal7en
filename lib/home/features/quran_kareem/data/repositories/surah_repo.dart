import 'package:untitled/home/features/quran_kareem/data/models/surah_model.dart';
import 'package:untitled/home/features/quran_kareem/data/data_resources/remote_data_source.dart';

import '../../domain/repositories/surahs_repo.dart';

class SurahsRepoImpl extends SurahsRepo {
  SurahsRepoImpl._();

  static final SurahsRepoImpl instance = SurahsRepoImpl._();

  @override
  Future<List<SurahDataModel>> loadAllSurahs() async {
    try {
      return await QuranRemoteDataSourceImpl.instance.loadAllSurahs();
    } catch (e) {
      rethrow;
    }
  }
}
