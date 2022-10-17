import 'package:untitled/home/features/azkar/domain/entity/azkar_category.dart';

abstract class AzkarRepo{
  Future<List<AzkarCategory>> getAzkar();
  
}