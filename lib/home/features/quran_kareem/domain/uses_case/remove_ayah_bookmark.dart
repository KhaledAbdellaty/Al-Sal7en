import 'package:untitled/home/features/quran_kareem/data/repositories/quran_bookmarks_repo.dart';

class RemoveAyahFromBookMarkUseCase {
  Future<void> call(String ayahText) async {
    return await QuranBookMarksRepoImpl.instance.removefromBookMark(ayahText);
  }
}
