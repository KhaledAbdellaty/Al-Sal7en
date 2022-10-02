import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/surah_model.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahDataModel>> loadAllSurahs();
  Future<Map<String, dynamic>> loadAyahFromPage(int index);
}





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

  @override
  Future<List<SurahDataModel>> loadAllSurahs() async {
    final List<SurahDataModel> surahs = [];
    final json = await rootBundle.loadString('assets/json/all_quran.json');
    List<dynamic> collection = jsonDecode(json);

    collection.map((e) {
      surahs.add(SurahDataModel.fromJson(e));
    }).toList();

    return surahs;
  }

  @override
  Future<Map<String, dynamic>> loadAyahFromPage(int index) async {
    final json = await rootBundle.loadString('assets/json/$index.json');
    var collection = jsonDecode(json);
    Map<String, dynamic> data = collection;

    return data;
  }
}
