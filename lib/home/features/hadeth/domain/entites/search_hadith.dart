import 'package:equatable/equatable.dart';

class SearchHadith extends Equatable {
  SearchHadith({
    required this.elMohdith,
    required this.grade,
    required this.hadith,
    required this.numberOrPage,
    required this.elRawi,
    required this.source,
    this.id,
  });

  final String hadith, elRawi, elMohdith, source, numberOrPage, grade;
  final int? id;

  @override
  List<Object?> get props => [
        hadith,
        elRawi,
        elMohdith,
        source,
        numberOrPage,
        grade,
        id,
      ];
}
