import 'package:untitled/home/features/quran_kareem/data/repositories/ayas_repo.dart';

import '../entity/ayah.dart';

class LoadSurahByPageUseCase {
  // Future<List<AyahData>> call(int index) async {
  //   return await AyahsRepoImpl.instance.loadAyahFromPage(index);
  // }
  Future<Map<String, dynamic>> call(int index) async {
    return await AyahsRepoImpl.instance.loadAyahFromPage(index);
  }
}
