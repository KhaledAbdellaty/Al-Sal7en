import 'package:untitled/home/features/quran_kareem/domain/entity/ayah.dart';

import '../../data/repositories/quran_bookmarks_repo.dart';

class GetAllBookMarksUseCase {
  Future<List<AyahData>> call() async {
    return await QuranBookMarksRepoImpl.instance.getAllBookMarks();
  }
}
