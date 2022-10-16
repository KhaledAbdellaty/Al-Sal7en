import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entites/chapter.dart';
import '../entites/hadith.dart';
import '../entites/hadith_book.dart';
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
  // Future<Either<Failur, Unit>> setHadithLocal(SearchHadith searchHadith);
  // Future<Either<Failur, List<SearchHadith>>> getHadithLocal();
}
