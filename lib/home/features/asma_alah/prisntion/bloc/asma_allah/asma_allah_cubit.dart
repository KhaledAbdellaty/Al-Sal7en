
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domen/emtites/asma_alah.dart';
import '../../../domen/use_cases/get_asma_allah_use_case.dart';

part 'asma_allah_state.dart';

class AsmaAllahCubit extends Cubit<AsmaAllahState> {
  AsmaAllahCubit({required this.getAsmaAllahUseCase})
      : super(AsmaAllahInitial());
  final GetAsmaAllahUseCase getAsmaAllahUseCase;

  getAsmaAllah() async{
    emit(AsmaAllahLodingState());
    final data =await getAsmaAllahUseCase.getAsmaAllah();
    emit(AsmaAllahDoneState(data: data));
  }
}
