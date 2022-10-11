part of 'book_cubit.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLodingState extends BookState {}

class BookErrorState extends BookState {
  final String massegesError;

  BookErrorState(this.massegesError);
  @override
  List<Object> get props => [massegesError];
}

class DoneBookState extends BookState {
  final List<Book> books;

  DoneBookState(this.books);
  @override
  List<Object> get props => [books];
}


