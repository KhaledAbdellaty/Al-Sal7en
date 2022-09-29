import 'package:untitled/home/features/quran_kareem/domain/entity/ayah.dart';

class Ayahs {
  final List<AyahDataModel> ayah;

  Ayahs({required this.ayah});
  factory Ayahs.fromJson(Map<String, dynamic> json) {
    var list = json as List<dynamic>;
    List<AyahDataModel> a = list.map((i) => AyahDataModel.fromJson(i)).toList();
    return Ayahs(ayah: a);
  }
}

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
      page: json['page'],
      text: json['text'],
      numberOfSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      hizbQuarter: json['hizbQuarter'],
      // sajda: json['sajda'],
    );
  }
}
