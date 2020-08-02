import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../repository/repositories.dart';

part 'atividades_event.dart';
part 'atividades_state.dart';

class AtividadesBloc extends Bloc<AtividadesEvent, AtividadesState> {
  AtividadesBloc({
    @required AtividadeRepository atividadeRepository,
  })  : assert(atividadeRepository != null),
        _atividadeRepository = atividadeRepository,
        super(AtividadesLoadInProgress());

  final AtividadeRepository _atividadeRepository;

  @override
  Stream<AtividadesState> mapEventToState(
    AtividadesEvent event,
  ) async* {
    if (event is AtividadesRequested) {
      yield* _mapAtividadesRequestedToState(event);
    } else if (event is AtividadesRefreshRequested) {
      yield* _mapAtividadesRefreshRequestedToState(event);
    }
  }

  Stream<AtividadesState> _mapAtividadesRequestedToState(
    AtividadesRequested event,
  ) async* {
    yield AtividadesLoadInProgress();

    try {
      List<Atividade> atividades = await _atividadeRepository.getAtividades();
      if (atividades == null) {
        yield AtividadesLoadFailure();
      }
      yield AtividadesLoadSuccess(atividades);
    } catch (_) {
      yield AtividadesLoadFailure();
    }
  }

  Stream<AtividadesState> _mapAtividadesRefreshRequestedToState(
      AtividadesRefreshRequested event) async* {
    try {
      List<Atividade> atividades = await _atividadeRepository.getAtividades();
      if (atividades != null) {
        yield AtividadesLoadSuccess(atividades);
      }
    } catch (_) {}
  }
}
