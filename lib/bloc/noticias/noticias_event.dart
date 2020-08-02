part of 'noticias_bloc.dart';

abstract class NoticiasEvent extends Equatable {
  const NoticiasEvent();

  @override
  List<Object> get props => [];
}

class NoticiasRequested extends NoticiasEvent {}

class NoticiasRefreshRequested extends NoticiasEvent {}
