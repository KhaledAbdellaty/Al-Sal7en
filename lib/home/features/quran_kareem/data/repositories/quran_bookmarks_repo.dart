import 'package:untitled/home/features/quran_kareem/data/data_resources/local_data_source.dart';
import 'package:untitled/home/features/quran_kareem/data/models/ayah_model.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/ayah.dart';
import 'package:untitled/home/features/quran_kareem/domain/repositories/quran_bookmarks_repo.dart';

class QuranBookMarksRepoImpl extends QuranBookMarkRepo {
  QuranBookMarksRepoImpl._();
  static final QuranBookMarksRepoImpl instance = QuranBookMarksRepoImpl._();
  @override
  Future<void> addToBookMark(AyahDataModel ayahDataModel) {
    try {
      return QuranLocalDataSource.instance.addToBookMark(ayahDataModel.toMap());
    } catch (e) {
      throw 'Error on Add To Markbook $e';
    }
  }

  @override
  Future<void> removefromBookMark(String ayahText) async {
    try {
      await QuranLocalDataSource.instance.removefromBookMark(ayahText);
    } catch (e) {
      throw 'Error on Delete From BookMark $e';
    }
  }

  @override
  Future<List<AyahData>> getAllBookMarks() async {
    try {
      final bookMarks = await QuranLocalDataSource.instance.getAllBookMarks();
      final List<AyahData> bookMarkFromMap = bookMarks
          .map<AyahData>((ayah) => AyahDataModel.fromJson(ayah))
          .toList();
      return bookMarkFromMap;
    } catch (e) {
      throw 'Error on Get All BookMarks $e';
    }
  }
}
