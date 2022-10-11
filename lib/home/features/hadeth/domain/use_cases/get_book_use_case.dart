
import '../entites/hadith_book.dart';
import '../hadith_rep/hadith_book_rep.dart';

class GetBookUseCase {
  final HadithRepo hadithRepo;

  GetBookUseCase({required this.hadithRepo});
  Future<List<Book>> call() {
    return hadithRepo.getBookRep();
  }
}
