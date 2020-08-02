import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

class ApiService {
  ApiService({
    @required Dio dio,
    this.baseUrl = '',
  })  : assert(dio != null),
        _dio = dio {
    dio.options.baseUrl = baseUrl;
  }

  final Dio _dio;
  final String baseUrl;

  Future<Participante> getParticipante(LogInDto logInDto) async {
    final _data = logInDto.toJson();
    final _result = await _dio.post(
      '/api/dados-usuario',
      data: _data,
    );

    final value = Participante.fromJson(_result.data as Map<String, dynamic>);
    return value;
  }

  Future<List<Atividade>> getAtividades() async {
    var dio = _dio;
    final _result = await dio.get(
      '/api/atividades',
    );
    final _value = _result.data
        .map((i) => Atividade.fromJson(i as Map<String, dynamic>))
        .toList();
    return _value;
  }
}
