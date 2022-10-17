import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/azkar_category.dart';
import '../../domain/uses_case/azkar_use_case.dart';


part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit({required this.azkarUseCase}) : super(AzkarInitial());
 final AzkarUseCase azkarUseCase;

 getAzkar()async{

  emit(AzkarLoadingState());
final data = await azkarUseCase.getAzkar();
emit(AzkarSucssecState(azkarData: data));


 }
}

