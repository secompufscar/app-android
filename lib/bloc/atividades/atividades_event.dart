part of 'atividades_bloc.dart';

@immutable
abstract class AtividadesEvent extends Equatable {
  const AtividadesEvent();

  @override
  List<Object> get props => [];
}

class AtividadesRequested extends AtividadesEvent {}

class AtividadesRefreshRequested extends AtividadesEvent {}
