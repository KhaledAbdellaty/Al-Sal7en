import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:untitled/features/quran_kareem/data/models/ayah_model.dart';

import 'models/surah_model.dart';

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
}
