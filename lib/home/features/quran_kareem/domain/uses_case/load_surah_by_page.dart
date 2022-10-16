import 'package:untitled/home/features/quran_kareem/data/repositories/ayahs_repo.dart';



class LoadSurahByPageUseCase {
  Future<Map<String, dynamic>> call(int index) async {
    return await AyahsRepoImpl.instance.loadAyahFromPage(index);
  }
}
