import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(AppBarState());

  startSearch() {
    emit(state.copyWith(isSearch: true));
  }
  stopSearch() {
    emit(state.copyWith(isSearch: false));
  }
}
