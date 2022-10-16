import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/internet_check/network_info.dart';
import '../../domain/entites/hadith.dart';
import '../../domain/entites/hadith_book.dart';
import '../../domain/entites/search_hadith.dart';
import '../../domain/hadith_rep/hadith_book_rep.dart';
import '../data_resources/remot_date_sorc.dart';
import '../model/chapter_model.dart';

class HadithRepImp implements HadithRepo {
  final RemotdateSurse remotdateSurse;
  final NetworkInfo networkInfo;
  //final LocalDataSurc localDataSurc;

  HadithRepImp({
    required this.networkInfo,
    required this.remotdateSurse,
    // required this.localDataSurc,
  });

  @override
  Future<List<Book>> getBookRep() async {
    print("run get Book Rep ");
    return await remotdateSurse.getBooks();
  }

  @override
  Future<Either<Failur, ChaptersModel>> getChaptir(String book) async {
    if (await networkInfo.iscommected) {
      try {
        final date = await remotdateSurse.getchapter(book);
        return Right(date);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failur, List<SearchHadith>>> search(
      String value, int page) async {
    print("===search in Repi impl===");

    // عمل فحص للانترنت
    if (await networkInfo.iscommected) {
      // عمل فحص للسيرفر
      try {
        final date = await remotdateSurse.searchHadith(value, page);
        // عمل فحص للداتا
        return Right(date);
      } on ServerException {
        return Left(ServerFailure());
      } on NoDateException {
        return Left(NoDateFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failur, HadithChapterInfo>> getHadithChapterInfo({
    required String BookSlug,
    required String chapterNumber,
    int? current_page,
  }) async {
    if (await networkInfo.iscommected) {
      try {
        final hadith = await remotdateSurse.gethadith(
          BookSlug: BookSlug,
          chapterNumber: chapterNumber,
          current_page: current_page,
        );
        return Right(hadith);
      } on ServerException {
        return Left(ServerFailure());
      } on NoDateException {
        return Left(NoDateFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  // @override
  // Future<Either<Failur, Unit>> setHadithLocal(SearchHadith searchHadith) async {
  //   try {
  //     await localDataSurc.setHadithLocal(searchHadith);
  //     return Right(unit);
  //   } catch (e) {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failur, List<SearchHadith>>> getHadithLocal() async {
  //   try {
  //     final data = await localDataSurc.getDataLocal();

  //     return Right(data);
  //   } catch (e) {
  //     return Left(ServerFailure());
  //   }
  // }
}
