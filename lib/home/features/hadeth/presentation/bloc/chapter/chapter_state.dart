part of 'chapter_cubit.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

class ChapterInitial extends ChapterState {}
class LodingState extends ChapterState {}
class ErrorState extends ChapterState {
  final String massegesError;

  ErrorState(this.massegesError);
  @override
  List<Object> get props => [massegesError];
}
class DoneState extends ChapterState {
  final Chapters chapters;

  DoneState(this.chapters);
  @override
  List<Object> get props => [chapters];
}

