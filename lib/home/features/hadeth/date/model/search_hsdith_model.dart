import 'package:aqra_application/core/constans.dart';
import 'package:aqra_application/hadeth/domen/entites/search_hadith.dart';

class SearchHadithModel extends SearchHadith {
  SearchHadithModel(
      {required super.elMohdith,
      required super.grade,
      required super.hadith,
      required super.numberOrPage,
      required super.elRawi,
      required super.source,
      super.id});
  factory SearchHadithModel.fromJson(Map<String, dynamic> json) {
    return SearchHadithModel(
        elMohdith: json["el_mohdith"],
        grade: json["grade"],
        hadith: json["hadith"],
        numberOrPage: json["number_or_page"],
        elRawi: json["el_rawi"],
        source: json["source"],
        id: json["id"]);
  }
  Map<String, dynamic> toMap() {
    return {
      columnElMohdith: elMohdith,
      columnElRawi: elRawi,
      columnGrade: grade,
      columnHadith: hadith,
      columnNumberOrPage: numberOrPage,
      columnSource: source,
      columnID: id,
    };
  }
}
