part of 'save_hadith_cubit.dart';

abstract class SaveHadithState extends Equatable {
  const SaveHadithState();

  @override
  List<Object> get props => [];
}

class SaveHadithInitial extends SaveHadithState {}

class SaveHadithDoneState extends SaveHadithState {
  const SaveHadithDoneState({required this.hadiths});
  final List<SearchHadith> hadiths;
}

class SaveHadithLodingState extends SaveHadithState {}

class SaveHadithErorrState extends SaveHadithState {}

class SaveHadithNoDataState extends SaveHadithState {}
