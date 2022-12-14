
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/hadith_book.dart';
import '../../../domain/use_cases/get_book_use_case.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  static BookCubit get(context)=>BlocProvider.of(context);

  BookCubit({
   
    required this.getHadithBookUse,
  }) : super(BookInitial());
  final GetBookUseCase getHadithBookUse;
  


  getBook() async {
     emit(BookLodingState());
    final books = await getHadithBookUse.call();
    
    emit(DoneBookState(books));
  }

 
}
