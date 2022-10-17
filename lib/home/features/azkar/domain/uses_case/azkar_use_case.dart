
import 'package:untitled/home/features/azkar/domain/repositories/azkar_repo.dart';

import '../entity/azkar_category.dart';

class AzkarUseCase{
 final AzkarRepo azkarRepo;

  AzkarUseCase(this.azkarRepo);

 Future<List<AzkarCategory>> getAzkar()  async{
  return await azkarRepo.getAzkar();
 }
}