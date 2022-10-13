import 'package:equatable/equatable.dart';

class AsmaAllah extends Equatable {
  AsmaAllah({required this.text, required this.titel});
  final String text, titel;

  @override
 
  List<Object?> get props => [text, titel];
}
