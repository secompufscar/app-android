import '../../models/models.dart';

class ParticipanteRepository {
  Participante _participante;

  Future<Participante> getParticipante() async {
    return Future.value(_participante);
  }

  Future<void> saveParticipante(Participante newParticipante) async {
    _participante = newParticipante;
  }
}
