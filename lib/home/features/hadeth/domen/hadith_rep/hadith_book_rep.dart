import 'package:aqra_application/hadeth/date/model/search_hsdith_model.dart';
import 'package:aqra_application/hadeth/domen/entites/chapter.dart';
import 'package:aqra_application/hadeth/domen/entites/hadith.dart';
import 'package:aqra_application/hadeth/domen/entites/hadith_book.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entites/search_hadith.dart';

abstract class HadithRepo {
  Future<List<Book>> getBookRep();
  Future<Either<Failur, Chapters>> getChaptir(String book);
  Future<Either<Failur, List<SearchHadith>>> search(String value, int page);
  Future<Either<Failur, HadithChapterInfo>> getHadithChapterInfo({
    required String BookSlug,
    required String chapterNumber,
    int? current_page,
  });
  Future<Either<Failur, Unit>> setHadithLocal(SearchHadith searchHadith);
  Future<Either<Failur, List<SearchHadith>>> getHadithLocal();
}
