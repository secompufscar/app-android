import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../repository/repositories.dart';

part 'noticias_event.dart';
part 'noticias_state.dart';

class NoticiasBloc extends Bloc<NoticiasEvent, NoticiasState> {
  NoticiasBloc({
    @required NoticiaRepository noticiaRepository,
  })  : assert(noticiaRepository != null),
        _noticiaRepository = noticiaRepository,
        super(NoticiasLoadInProgress());

  final NoticiaRepository _noticiaRepository;

  @override
  Stream<NoticiasState> mapEventToState(
    NoticiasEvent event,
  ) async* {
    if (event is NoticiasRequested) {
      yield* _mapNoticiasRequestedToState(event);
    } else if (event is NoticiasRefreshRequested) {
      yield* _mapNoticiasRefreshRequestedToState(event);
    }
  }

  Stream<NoticiasState> _mapNoticiasRequestedToState(
    NoticiasRequested event,
  ) async* {
    yield NoticiasLoadInProgress();

    try {
      final _noticias = await _noticiaRepository.getNoticias();
      yield NoticiasLoadSuccess(_noticias);
    } catch (_) {
      yield NoticiasLoadFailure();
    }
  }

  Stream<NoticiasState> _mapNoticiasRefreshRequestedToState(
    NoticiasRefreshRequested event,
  ) async* {
    try {
      final _noticias = await _noticiaRepository.getNoticias();
      yield NoticiasLoadSuccess(_noticias);
    } catch (_) {}
  }
}
