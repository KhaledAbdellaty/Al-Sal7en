import 'package:equatable/equatable.dart';

class Azkar extends Equatable{
  final int? id;
  final String arabicText;
  final int repeat;
  final String? audio;

  Azkar(
    {this.id,
  required this.arabicText,
  required this.repeat,
   this.audio}
   );
   
     @override
     // TODO: implement props
     List<Object?> get props => [id,arabicText,repeat,audio];
}