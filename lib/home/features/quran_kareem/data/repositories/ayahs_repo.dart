import 'package:untitled/home/features/quran_kareem/data/models/ayah_model.dart';
import 'package:untitled/home/features/quran_kareem/data/models/surah_model.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/surah.dart';
import 'package:untitled/home/features/quran_kareem/domain/repositories/ayahs_repo.dart';

import '../data_resources/remote_data_source.dart';

class AyahsRepoImpl extends AyahsRepo {
  AyahsRepoImpl._();

  static final AyahsRepoImpl instance = AyahsRepoImpl._();
  // Future<List<AyahDataModel>> loadAyahFromPage(int index) async {
  //   try {
  //     return await QuranRemoteDataSourceImpl.instance.loadAyahFromPage(index);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  @override
  Future<Map<String, dynamic>> loadAyahFromPage(int index) async {
    try {
      return await QuranRemoteDataSourceImpl.instance.loadAyahFromPage(index);
    } catch (e) {
      rethrow;
    }
  }

}
