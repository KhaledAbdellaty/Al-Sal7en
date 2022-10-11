import 'package:aqra_application/hadeth/date/model/hadith/hadith_chapter_data_model.dart';

import '../../../domen/entites/hadith.dart';

class HadithChapterInfoModel extends HadithChapterInfo {
  HadithChapterInfoModel(super.hadiths);
  factory HadithChapterInfoModel.fromJson(Map<String,dynamic> json) {
    return HadithChapterInfoModel(HadithChapterDataModel.fromJson(json["hadiths"]));
  }
}
