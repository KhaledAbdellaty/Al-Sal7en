part of 'hadith_cubit.dart';

abstract class HadithState extends Equatable {
  const HadithState();

  @override
  List<Object> get props => [];
}

class HadithInitial extends HadithState {}

class HadithLodingState extends HadithState {}

class HadithDoneState extends HadithState {
  final List <HadithChapterInfo> hadithChapterInfo;

  HadithDoneState({required this.hadithChapterInfo});
  @override
  List<Object> get props => [hadithChapterInfo];
}

class HadithErrorState extends HadithState {
  final String errorMassege;

  HadithErrorState({required this.errorMassege});
   @override
  List<Object> get props => [errorMassege];
}

class HadithNoDateState extends HadithState {
}
