

import '../../domain/entity/azkar_category.dart';
import '../../domain/repositories/azkar_repo.dart';
import '../data_source/local_data_source.dart';

class AzkarRepoImp extends AzkarRepo{
 final AzkarDataSource azkarDataSource;

  AzkarRepoImp(this.azkarDataSource);
  @override
  Future<List<AzkarCategory>> getAzkar() async{
   return  azkarDataSource.getAzkar();
  
   
  }

}