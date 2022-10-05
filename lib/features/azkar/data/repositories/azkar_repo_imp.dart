import 'package:untitled/features/azkar/data/data_source/local_data_source.dart';
import 'package:untitled/features/azkar/domain/entity/azkar_category.dart';
import 'package:untitled/features/azkar/domain/repositories/azkar_repo.dart';

class AzkarRepoImp extends AzkarRepo{
 final AzkarDataSource azkarDataSource;

  AzkarRepoImp(this.azkarDataSource);
  @override
  Future<List<AzkarCategory>> getAzkar() async{
   return  azkarDataSource.getAzkar();
  
   
  }

}