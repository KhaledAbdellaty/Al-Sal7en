
import '../../domain/entity/azkar.dart';

class AzkarModel extends Azkar{
  AzkarModel({required super.arabicText, required super.repeat});


  factory AzkarModel.fromJson(Map<String,dynamic>json){
    return AzkarModel(arabicText: json["ARABIC_TEXT"], repeat: json["REPEAT"]);
  }

}