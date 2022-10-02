part of 'app_bar_cubit.dart';

class AppBarState {
  bool isSearch;
  AppBarState({
    this.isSearch = false,
  });

  AppBarState copyWith({bool? isSearch}) {
    return AppBarState(isSearch: isSearch ?? this.isSearch);
  }
}
