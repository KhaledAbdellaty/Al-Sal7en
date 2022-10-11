import 'package:aqra_application/hadeth/domen/entites/search_hadith.dart';
import 'package:aqra_application/hadeth/domen/hadith_rep/hadith_book_rep.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class GetHadithLocalUseCase {
  final HadithRepo hadithRepol;

  GetHadithLocalUseCase({required this.hadithRepol});
  Future<Either<Failur, List<SearchHadith>>> getHadithLocal() async {
    return await hadithRepol.getHadithLocal();
  }
}
