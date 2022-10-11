import 'package:aqra_application/core/error/failures.dart';
import 'package:aqra_application/hadeth/domen/entites/chapter.dart';
import 'package:aqra_application/hadeth/domen/hadith_rep/hadith_book_rep.dart';
import 'package:dartz/dartz.dart';

class GetChaptirUseCase {
  final HadithRepo hadithBookRepo;

  GetChaptirUseCase({required this.hadithBookRepo});
  Future<Either<Failur, Chapters>> call(String book) {
    
  return  hadithBookRepo.getChaptir(book);
  }
}
