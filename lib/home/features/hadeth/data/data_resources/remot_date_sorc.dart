
import 'package:dio/dio.dart';
import '../books.dart';
import '../model/book_model.dart';
import '../model/chapter_model.dart';
import '../model/hadith/hadith_chapter_info_model.dart';
import '../model/search_hsdith_model.dart';

abstract class RemotdateSurse {
  Future<List<BookModel>> getBooks();
  Future<ChaptersModel> getchapter(String BookSlug);
  Future<HadithChapterInfoModel> gethadith({
    required String BookSlug,
    required String chapterNumber,
    int? current_page,
  });

  Future<List<SearchHadithModel>> searchHadith(String value, int page);
}

class RemotDateSurseWithDio implements RemotdateSurse {
  final Dio dio = Dio();
  String key = r"$2y$10$LMxyPILqG6D15aYMiga4gutLXKEWpAyZqlJipH3yvo0D5bkUz0Lba";
  @override
  Future<List<BookModel>> getBooks() async {
    final List<BookModel> date =
        await books.map((e) => BookModel.fromJson(e)).toList();
    print("Books have been brought==");

    return date;
  }

  @override
  Future<ChaptersModel> getchapter(String BookSlug) async {
    final date = await dio.get(
        "https://www.hadithapi.com/api/$BookSlug/chapters",
        queryParameters: {
          "apiKey": key,
        });
    if (date.statusCode == 200) {
      final dateChaptirs = await ChaptersModel.fromJson(date.data);
      return dateChaptirs;
    } else if (date.statusCode == 404) {
      throw NoDateException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<HadithChapterInfoModel> gethadith(
      {required String BookSlug,
      required String chapterNumber,
      int? current_page}) async {
    final response = await dio
        .get("https://www.hadithapi.com/api/hadiths/", queryParameters: {
      "apiKey": key,
      "page": current_page,
      "book": BookSlug,
      "chapter": chapterNumber,
    });
    if (response.statusCode == 200) {
      final allHadith = await HadithChapterInfoModel.fromJson(response.data);
      return allHadith;
    } else if (response.statusCode == 404) {
      throw NoDateException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SearchHadithModel>> searchHadith(String value, int page) async {
    final response = await dio.get(
        "https://dorar-hadith-api.onrender.com/api/search?page=$page&value=$value");
    if (response.statusCode == 200) {
      final List date = response.data;
      if (date.isNotEmpty) {
        print(date);
        final List<SearchHadithModel> searchValue =
            date.map((e) => SearchHadithModel.fromJson(e)).toList();

        return searchValue;
      } else {
        print("===NoDateException===");
        throw NoDateException();
      }
    } else {
        print("===ServerException===");

      throw ServerException();
    }
  }
}
