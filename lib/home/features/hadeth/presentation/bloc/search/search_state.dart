part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLodingState extends SearchState {}

class SearchNoDateState extends SearchState {}

class SearchErrorState extends SearchState {
  final String massegeError;

  const SearchErrorState({required this.massegeError});
  @override
  List<Object> get props => [massegeError];
}

class SearchDoneState extends SearchState {
  final List<SearchHadith> date;

  const SearchDoneState({required this.date});
  @override
  List<Object> get props => [date];
}

class FlotingState extends SearchState {
  final bool show;

  const FlotingState(this.show);
}
