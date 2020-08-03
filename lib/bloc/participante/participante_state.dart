part of 'participante_bloc.dart';

abstract class ParticipanteState extends Equatable {
  const ParticipanteState();

  @override
  List<Object> get props => [];
}

class ParticipanteInitial extends ParticipanteState {}

class ParticipanteLoadInProgress extends ParticipanteState {}

class ParticipanteLoadSuccess extends ParticipanteState {
  const ParticipanteLoadSuccess(this.participante);

  final Participante participante;

  @override
  List<Object> get props => [participante];
}

class ParticipanteLoadFailure extends ParticipanteState {}
