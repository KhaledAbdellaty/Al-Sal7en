part of 'asma_allah_cubit.dart';

abstract class AsmaAllahState extends Equatable {
  const AsmaAllahState();

  @override
  List<Object> get props => [];
}

class AsmaAllahInitial extends AsmaAllahState {}

class AsmaAllahLodingState extends AsmaAllahState {}

class AsmaAllahDoneState extends AsmaAllahState {
  final List<AsmaAllah> data;

  AsmaAllahDoneState({required this.data});
}
