import 'package:aqra_application/core/error/failures.dart';
import 'package:aqra_application/hadeth/date/model/search_hsdith_model.dart';
import 'package:aqra_application/hadeth/domen/entites/search_hadith.dart';
import 'package:aqra_application/hadeth/domen/hadith_rep/hadith_book_rep.dart';
import 'package:dartz/dartz.dart';

class SaveHadithUseCase {
  final HadithRepo hadithRepo;

  SaveHadithUseCase({required this.hadithRepo});
   Future<Either<Failur, Unit>> saveHadithUseCase(SearchHadith searchHadith) {
    return hadithRepo.setHadithLocal(searchHadith);
  }
}
