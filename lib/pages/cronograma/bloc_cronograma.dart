import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/ministrante.dart';
import 'package:app_secomp/util/api_helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class BlocCronograma extends BlocBase {
  BlocCronograma();
  APIHelper api = APIHelper();

  List<Atividade> atividades;
  var _atividadesController = BehaviorSubject<List<Atividade>>.seeded([]);
  Stream<List<Atividade>> get outAtividades => _atividadesController.stream;
  Sink<List<Atividade>> get inAtividades => _atividadesController.sink;

  void fetchAtividades() async {
    print("carregando atividades..");
    atividades = await api.getAtividades();
    print("carregou");
    if (atividades.isEmpty || atividades == null) {
      print("erroo");
      _atividadesController.add(_atividadesController.value = []);
    }
    inAtividades.add(_atividadesController.value = atividades);
  }

  // void teste() {
  //   final List<Atividade> listaAtv = [
  //     Atividade(
  //         tipo: Tipo.Institucional,
  //         titulo: "Credenciamento",
  //         ministrantes: [Ministrante("Secomp UFSCar", "Secomp", "UFSCar")],
  //         inicio: DateTime.parse("2019-09-09 08:00:00"),
  //         fim: DateTime.parse("2019-09-09 09:00:00"),
  //         local: "Anfiteatro Bento Prado Jr.",
  //         descricao: "descricao"),
  //     Atividade(
  //         tipo: Tipo.Institucional,
  //         titulo: "Abertura",
  //         ministrante: [Ministrante("Secomp UFSCar", "Secomp", "UFSCar")],
  //         inicio: DateTime.parse("2019-09-09 09:00:00"),
  //         fim: DateTime.parse("2019-09-09 10:00:00"),
  //         local: "Anfiteatro Bento Prado Jr.",
  //         descricao: "descricao"),
  //     Atividade(
  //         tipo: Tipo.Palestra,
  //         titulo: "Crimes Digitais e Computação Forense",
  //         ministrante:
  //             Ministrante("Vaine Luiz Barreira", "Professor", "UFSCar"),
  //         inicio: DateTime.parse("2019-09-10 08:00:00"),
  //         fim: DateTime.parse("2019-09-10 09:00:00"),
  //         local: "Anfiteatro Bento Prado Jr.",
  //         descricao: "descricao"),
  //     Atividade(
  //         tipo: Tipo.Palestra,
  //         titulo:
  //             "Homem x Máquina: o impacto da Inteligência Artificial na saúde",
  //         ministrante:
  //             Ministrante("Michel Silva Fornaciali", "Professor", "UFSCar"),
  //         inicio: DateTime.parse("2019-09-11 08:00:00"),
  //         fim: DateTime.parse("2019-09-11 09:00:00"),
  //         local: "Anfiteatro Bento Prado Jr.",
  //         descricao: "descricao"),
  //     Atividade(
  //         tipo: Tipo.Coffee,
  //         titulo: "Coffee-break",
  //         ministrante: Ministrante("", "", ""),
  //         inicio: DateTime.parse("2019-09-11 12:00:00"),
  //         fim: DateTime.parse("2019-09-11 13:00:00"),
  //         local: "Anfiteatro Bento Prado Jr. - anexo",
  //         descricao: "descricao"),
  //     Atividade(
  //         tipo: Tipo.Workshop,
  //         titulo: "Workshop Roi Hero",
  //         ministrante:
  //             Ministrante("Paulo Waib Castello Branco", "Professor", "UFSCar"),
  //         inicio: DateTime.parse("2019-09-12 08:00:00"),
  //         fim: DateTime.parse("2019-09-12 09:00:00"),
  //         local: "Anfiteatro Bento Prado Jr.",
  //         descricao: "descricao"),
  //   ];

  //   inAtividades.add(_atividadesController.value = listaAtv);
  // }

  void reload() async {
    inAtividades.add(_atividadesController.value = null);
    fetchAtividades();
  }

  @override
  void dispose() {
    _atividadesController.close();
    super.dispose();
  }
}
