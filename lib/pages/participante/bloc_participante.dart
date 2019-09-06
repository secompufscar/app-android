import 'package:app_secomp/models/participante.dart';
import 'package:app_secomp/util/api_helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlocParticipante extends BlocBase {
  APIHelper api = APIHelper();

  Participante participante;
  final participanteController = BehaviorSubject<Participante>.seeded(null);
  Stream<Participante> get outParticipante => participanteController.stream;
  Sink<Participante> get inParticipante => participanteController.sink;

  void setParticipante(Participante participante) {
    this.participante = participante;
    inParticipante.add(participanteController.value = participante);
  }

  void fetchPaticipante(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    this.participante = await api.fetchParticipante(password, email);
    inParticipante.add(participanteController.value = participante);
  }

  @override
  void dispose() {
    participanteController.close();
    super.dispose();
  }
}
