import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/util/api_helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class BlocCronograma extends BlocBase {
  BlocCronograma();
  APIHelper api = APIHelper();

  List<Atividade> atividades;
  var atividadesController = BehaviorSubject<List<Atividade>>.seeded([]);
  Stream<List<Atividade>> get outAtividades => atividadesController.stream;
  Sink<List<Atividade>> get inAtividades => atividadesController.sink;

  void fetchAtividades() async {
    print("carregando atividades..");
    atividades = await api.getAtividades();
    print("carregou");
    if (atividades.isEmpty || atividades == null) {
      print("erroo");
      atividadesController.add(atividadesController.value = []);
    }
    inAtividades.add(atividadesController.value = atividades);
  }

  void reload() async {
    inAtividades.add(atividadesController.value = null);
    fetchAtividades();
  }

  @override
  void dispose() {
    atividadesController.close();
    super.dispose();
  }
}
