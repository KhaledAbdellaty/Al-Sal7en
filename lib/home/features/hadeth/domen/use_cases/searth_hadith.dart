import 'package:aqra_application/hadeth/domen/hadith_rep/hadith_book_rep.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entites/search_hadith.dart';

class SearchHadithUseCases {
  final HadithRepo hadithRepo;

  SearchHadithUseCases({required this.hadithRepo});
  Future<Either<Failur, List<SearchHadith>>> call(String value,int page) {
    print("run user cases===");
    return hadithRepo.search(value,page);
  }
}
