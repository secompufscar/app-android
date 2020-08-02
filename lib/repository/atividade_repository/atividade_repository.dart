import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../service/services.dart';

class AtividadeRepository {
  AtividadeRepository({
    @required ApiService client,
  })  : assert(client != null),
        _client = client;

  final ApiService _client;

  Future<List<Atividade>> getAtividades() {
    return _client.getAtividades();
  }
}
