import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repository/repositories.dart';

part 'participante_event.dart';
part 'participante_state.dart';

class ParticipanteBloc extends Bloc<ParticipanteEvent, ParticipanteState> {
  ParticipanteBloc({
    ParticipanteRepository participanteRepository,
  })  : assert(participanteRepository != null),
        _participanteRepository = participanteRepository,
        super(ParticipanteInitial());

  final ParticipanteRepository _participanteRepository;
  @override
  Stream<ParticipanteState> mapEventToState(
    ParticipanteEvent event,
  ) async* {
    if (event is ParticipanteRequested) {
      yield* _mapParticipanteRequestedToState(event);
    }
  }

  Stream<ParticipanteState> _mapParticipanteRequestedToState(
      ParticipanteRequested event) async* {
    yield ParticipanteLoadInProgress();

    try {
      Participante participante =
          await _participanteRepository.getParticipante();
      if (participante == null) {
        yield ParticipanteLoadFailure();
      }
      yield ParticipanteLoadSuccess(participante);
    } catch (_) {
      yield ParticipanteLoadFailure();
    }
  }
}
