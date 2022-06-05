part of 'homecubit_cubit.dart';

@immutable
abstract class HomecubitState {}

class HomecubitInitial extends HomecubitState {}

class HomecubitLoading extends HomecubitState {}

class HomecubitLoaded extends HomecubitState {}

class HomecubitError extends HomecubitState {}
