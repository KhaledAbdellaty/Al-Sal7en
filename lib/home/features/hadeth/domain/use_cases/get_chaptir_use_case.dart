
import 'package:dartz/dartz.dart';

import '../entites/chapter.dart';
import '../hadith_rep/hadith_book_rep.dart';

class GetChaptirUseCase {
  final HadithRepo hadithBookRepo;

  GetChaptirUseCase({required this.hadithBookRepo});
  Future<Either<Failur, Chapters>> call(String book) {
    
  return  hadithBookRepo.getChaptir(book);
  }
}
