
import 'package:dartz/dartz.dart';

import '../entites/search_hadith.dart';
import '../hadith_rep/hadith_book_rep.dart';

class SaveHadithUseCase {
  final HadithRepo hadithRepo;

  SaveHadithUseCase({required this.hadithRepo});
   Future<Either<Failur, Unit>> saveHadithUseCase(SearchHadith searchHadith) {
    return hadithRepo.setHadithLocal(searchHadith);
  }
}
