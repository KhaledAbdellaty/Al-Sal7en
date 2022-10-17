
import 'package:untitled/home/features/azkar/azkar.dart';

import '../model/azkar_category_model.dart';

abstract class AzkarDataSource {
  Future<List<AzkarCategoryModel>>getAzkar();
}


class AzkarLocalData extends AzkarDataSource{
  @override
  Future<List<AzkarCategoryModel>> getAzkar()async {
  List<AzkarCategoryModel> azkarData= arabic.map((e) => AzkarCategoryModel.fromJson(e)).toList();
  return azkarData;
  }

}