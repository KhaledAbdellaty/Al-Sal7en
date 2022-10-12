
import 'package:dartz/dartz.dart';


import '../../../../../core/error/failures.dart';
import '../entites/hadith.dart';
import '../hadith_rep/hadith_book_rep.dart';

class GetHadithUseCase {
  final HadithRepo hadithRepo;

  GetHadithUseCase({required this.hadithRepo});
  Future<Either<Failur, HadithChapterInfo>> getHadithUseCase({required String BookSlug,required String chapterNumber, int? current_page,}) async{
    return await hadithRepo.getHadithChapterInfo(BookSlug: BookSlug,chapterNumber:chapterNumber ,current_page:current_page );

  }

}
