import 'package:untitled/home/features/quran_kareem/data/models/ayah_model.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/ayah.dart';

abstract class QuranBookMarkRepo {
  Future<void> addToBookMark(AyahDataModel ayahDataModel);

  Future<void> removefromBookMark(String ayahText);
  Future<List<AyahData>> getAllBookMarks();
}
