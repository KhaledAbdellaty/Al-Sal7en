import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String bookName,
      writerName,
      writerDeath,
      bookSlug,
      hadiths_count,
      
      chapters_count;
 final int id;
 

  Book({
    required this.id,
    required this.bookName,
    required this.writerName,
    required this.writerDeath,
    required this.bookSlug,
    required this.hadiths_count,
    
    required this.chapters_count,
  });

  @override
  List<Object?> get props => [
        id,
        bookName,
        writerName,
        writerDeath,
        bookSlug,
        hadiths_count,
        chapters_count,
       
      ];
}
