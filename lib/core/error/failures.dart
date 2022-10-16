import 'package:equatable/equatable.dart';

abstract class Failur extends Equatable{} 
class OfflineFailure extends Failur{
  @override
  
  List<Object?> get props => [];
}

class ServerFailure extends Failur{
  @override
  
  List<Object?> get props => [];
}  

class EmptyCacheFailure extends Failur{
  @override
  
  List<Object?> get props => [];
}
class NoDateFailure extends Failur{
  @override
  
  List<Object?> get props => [];
}