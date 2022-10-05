import 'package:untitled/features/azkar/domain/entity/azkar.dart';
import 'package:untitled/features/azkar/domain/entity/azkar_category.dart';

abstract class AzkarRepo{
  Future<List<AzkarCategory>> getAzkar();
  
}