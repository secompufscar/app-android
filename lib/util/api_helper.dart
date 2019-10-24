import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/credentials.dart';
import 'package:app_secomp/models/participante.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class APIHelper {
  Dio dio = new Dio()
    ..interceptors.add(DioCacheManager(CacheConfig()).interceptor);

  Future<List<Atividade>> getAtividades() async {
    String url = BASE_URL + "/api/atividades";
    try {
      final response = await dio.get(
        url,
        options: buildCacheOptions(
          Duration(days: 7),
          forceRefresh: true
        ),
      );

      if (response.statusCode == 200) {
        print("data: " + response.data.toString());
        return (response.data as List)
            .map<Atividade>((json) => Atividade.fromJson(json))
            .toList();
      } else {
        return Future.error('Failed to load');
      }
    } catch (e) {
      return [];
    }
  }

  Future<Participante> fetchParticipante(String password, String email) async {
    String url = BASE_URL + "/api/dados-usuario";
    try {
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
        options: buildCacheOptions(
          Duration(days: 7),
          forceRefresh: true
        ),
      );

      if (response.statusCode == 200) {
        if (response.data.toString() == "ERRO: senha inválida") {
          return Future.error("senha");
        } else if (response.data.toString() == "Usuário inexistente") {
          return Future.error("inexistente");
        }
        Map<String, dynamic> dados = response.data;
        return Participante(
          nome: dados['primeiro_nome'] + ' ' + dados['sobrenome'],
          camisetas: dados['camiseta'],
          presencas: dados['presencas'],
          pontos: dados['pontuacao'],
          uuid: dados['uuid'],
        );
      } else {
        return Future.error('erro participante');
      }
    } catch (e) {
      return Future.error('Fail: $e');
    }
  }
}
