part of 'participante_bloc.dart';

abstract class ParticipanteEvent extends Equatable {
  const ParticipanteEvent();
}

class ParticipanteRequested extends ParticipanteEvent {
  @override
  List<Object> get props => [];
}
