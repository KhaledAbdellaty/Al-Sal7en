part of 'azkar_cubit.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

class AzkarInitial extends AzkarState {}

class AzkarLoadingState extends AzkarState{}
class AzkarSucssecState extends AzkarState{

  final  List<AzkarCategory> azkarData;

  AzkarSucssecState({required this.azkarData});
}
class AzkarErrorState extends AzkarState{}



