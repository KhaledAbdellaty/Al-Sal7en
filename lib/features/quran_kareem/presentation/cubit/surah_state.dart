part of 'surah_cubit.dart';

@immutable
abstract class SurahState {}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<SurahData> surahData;

  SurahLoaded({required this.surahData});
}
