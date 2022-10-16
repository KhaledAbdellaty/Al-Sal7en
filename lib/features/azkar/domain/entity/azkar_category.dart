import 'package:equatable/equatable.dart';
import 'package:untitled/features/azkar/domain/entity/azkar.dart';

class AzkarCategory extends Equatable  {

  final int? id;
  final String title;
  final String? audioUrl;
  final List<Azkar> text;

  AzkarCategory(
    {this.id,
     required this.title,
      this.audioUrl,
      required this.text}
      );
      
        @override
       
        List<Object?> get props => [id,title,audioUrl,text]; 
}