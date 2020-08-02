part of 'atividades_bloc.dart';

@immutable
abstract class AtividadesState extends Equatable {
  const AtividadesState();

  @override
  List<Object> get props => [];
}

class AtividadesLoadInProgress extends AtividadesState {}

class AtividadesLoadSuccess extends AtividadesState {
  final List<Atividade> atividades;

  const AtividadesLoadSuccess([this.atividades = const []]);

  @override
  List<Object> get props => [atividades];

  @override
  String toString() => 'AtividadesLoadSuccess { atividades: $atividades }';
}

class AtividadesLoadFailure extends AtividadesState {}
