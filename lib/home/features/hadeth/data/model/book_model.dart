
import '../../domain/entites/hadith_book.dart';

class BookModel extends Book {
 BookModel(
      {required super.id,
      required super.bookName,
     
      required super.writerName,
      required super.writerDeath,
      required super.bookSlug,
      required super.hadiths_count,
      required super.chapters_count});
      factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["id"],
      bookName: json["bookName"],
      writerName: json["writerName"],
      writerDeath: json["writerDeath"],
      bookSlug: json["bookSlug"],
      hadiths_count: json["hadiths_count"],
      chapters_count: json["chapters_count"],
     
    );
  }
      
}
