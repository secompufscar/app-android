part of 'noticias_bloc.dart';

@immutable
abstract class NoticiasState extends Equatable {
  const NoticiasState();

  @override
  List<Object> get props => [];
}

class NoticiasLoadInProgress extends NoticiasState {}

class NoticiasLoadSuccess extends NoticiasState {
  final List<Noticia> noticias;

  const NoticiasLoadSuccess(this.noticias);

  @override
  List<Object> get props => [noticias];

}

class NoticiasLoadFailure extends NoticiasState {}
