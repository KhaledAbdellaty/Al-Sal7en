

import '../../../domain/entites/hadith.dart';
import 'hadith_chapter_data_model.dart';

class HadithChapterInfoModel extends HadithChapterInfo {
  HadithChapterInfoModel(super.hadiths);
  factory HadithChapterInfoModel.fromJson(Map<String,dynamic> json) {
    return HadithChapterInfoModel(HadithChapterDataModel.fromJson(json["hadiths"]));
  }
}
