
import '../../domen/emtites/asma_alah.dart';

class AsmaAllahModel extends AsmaAllah {
  AsmaAllahModel({required super.text, required super.titel});
  factory AsmaAllahModel.fromJson(Map<String, dynamic> json) {
    return AsmaAllahModel(
      text: json["text"],
      titel: json["name"],
    );
  }
}
