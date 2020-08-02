import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../service/services.dart';
import '../repositories.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({
    @required ApiService client,
    @required ParticipanteRepository participanteRepository,
  })  : assert(client != null),
        assert(participanteRepository != null),
        _client = client,
        _participanteRepository = participanteRepository;

  final _controller = StreamController<AuthenticationStatus>();
  final ApiService _client;
  final ParticipanteRepository _participanteRepository;

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    try {
      final response = await _client
          .getParticipante(LogInDto(email: email, password: password));

      if (response != null) {
        final participante = response;
        _participanteRepository.saveParticipante(participante);
        _controller.add(AuthenticationStatus.authenticated);
      }
    } on DioError catch (e) {
      throw new Exception(e.response);
    }
  }

  void logOut() {
    _participanteRepository.saveParticipante(null);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
