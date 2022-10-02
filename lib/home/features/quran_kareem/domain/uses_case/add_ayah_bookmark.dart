import 'package:untitled/home/features/quran_kareem/data/models/ayah_model.dart';
import 'package:untitled/home/features/quran_kareem/data/repositories/quran_bookmarks_repo.dart';

class AddAyahToBookMarkUseCase {
  Future<void> call( AyahDataModel ayahDataModel) async {
    await QuranBookMarksRepoImpl.instance.addToBookMark(ayahDataModel);
  }
}
