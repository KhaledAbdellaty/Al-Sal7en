import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:untitled/home/features/quran_kareem/data/models/ayah_model.dart';

import '../models/surah_model.dart';

abstract class QuranRemoteDataSource {}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  // Dio? dio;
  // QuranRemoteDataSourceImpl() {
  //  BaseOptions options = BaseOptions(
  //     baseUrl: baseUrl,
  //     receiveTimeout: 20 * 1000, // 20 seconds
  //     connectTimeout: 20 * 1000,
  //   );
  //   dio = Dio(options);
  // }
  QuranRemoteDataSourceImpl._();
  static final QuranRemoteDataSourceImpl instance =
      QuranRemoteDataSourceImpl._();
  Future<List<SurahDataModel>> loadSurah() async {
    final List<SurahDataModel> surahs = [];
    final json = await rootBundle.loadString('assets/json/all_quran.json');
    List<dynamic> collection = jsonDecode(json);

    collection.map((e) {
      surahs.add(SurahDataModel.fromJson(e));
    }).toList();

    return surahs;
  }

  // Future<List<AyahDataModel>> loadAyahFromPage(int index) async {
  //   final List<AyahDataModel> ayahs = [];
  //   final json = await rootBundle.loadString('assets/json/$index.json');
  //   var collection = jsonDecode(json);
  //   Map<String, dynamic> data = collection;
  //   var surahNo;
  //   data.forEach((key, value) {
  //     key = 'number';
  //     surahNo = value;
  //   });
  //   List<dynamic> ayah = data['ayahs'];
  //   Map<String, dynamic> surah = data['surahs'][surahNo.toString()];
  //   ayah.map((e) => ayahs.add(AyahDataModel.fromJson(e))).toList();
  //   final surahData = SurahDataModel.fromJson(surah);
  //   //print(ayahs.length);

  //   return ayahs;
  // }

  Future<Map<String, dynamic>> loadAyahFromPage(int index) async {
    final json = await rootBundle.loadString('assets/json/$index.json');
    var collection = jsonDecode(json);
    Map<String, dynamic> data = collection;

    return data;
  }
}
