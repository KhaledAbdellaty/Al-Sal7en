import 'package:aqra_application/hadeth/date/model/hadith/hadith_data_model.dart';

import '../../../domen/entites/hadith.dart';

class HadithChapterDataModel extends HadithChapterData {
  HadithChapterDataModel(
      {required super.currentPage,
      required super.lastPage,
      required super.data});
  factory HadithChapterDataModel.fromJson(Map<String, dynamic> json) {
    final List dataJson= json["data"];
    final List<HadithDataModel> data= dataJson.map((e) =>HadithDataModel.fromJson(e) ).toList();
    return HadithChapterDataModel(
      currentPage: json["current_page"],
      lastPage: json["last_page"],
      data:data,
    );
  }
}
