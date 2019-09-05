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
