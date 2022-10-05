import 'package:untitled/features/azkar/data/model/azkar_model.dart';
import 'package:untitled/features/azkar/domain/entity/azkar.dart';
import 'package:untitled/features/azkar/domain/entity/azkar_category.dart';

class AzkarCategoryModel extends AzkarCategory{
  AzkarCategoryModel({
    required super.title,
     required super.text
     });

     factory AzkarCategoryModel.fromJson(Map<String,dynamic>json) {
      final List<dynamic> azkarfromjason =json["TEXT"];
      final List<AzkarModel> azkarjason= azkarfromjason.map((e) => AzkarModel.fromJson(e)).toList();
return AzkarCategoryModel(title: json["TITLE"], text: azkarjason);

     }



}