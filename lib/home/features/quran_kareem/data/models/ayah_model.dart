import 'package:untitled/core/strings/constat_strings.dart';
import 'package:untitled/home/features/quran_kareem/domain/entity/ayah.dart';

class AyahDataModel extends AyahData {
  AyahDataModel({

    required super.page,
    required super.text,
    required super.numberOfSurah,
    required super.juz,
    required super.manzil,
    required super.hizbQuarter,
    //  required super.sajda,
  });

  factory AyahDataModel.fromJson(Map<String, dynamic> json) {
    return AyahDataModel(

      page: json[pageNo],
      text: json[text],
      numberOfSurah: json[numberOfSurah],
      juz: json[juz],
      manzil: json[manzil],
      hizbQuarter: json[hizbQuarter],
      // sajda: json['sajda'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      pageNo: page,
      text: super.text,
      numberOfSurah: super.numberOfSurah,
      juz: super.numberOfSurah,
      manzil: super.manzil,
      hizbQuarter: super.hizbQuarter,
    };
    return map;
  }
}
