import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/credentials.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class APIHelper {
  Dio dio = new Dio()
    ..interceptors.add(DioCacheManager(CacheConfig()).interceptor);

  Future<List<Atividade>> getAtividades() async {
    String url = BASE_URL + "/api/atividades/10";
    try {
      final response = await dio.get(
        url,
        options: buildCacheOptions(
          Duration(days: 7),
        ),
        
      );

      if (response.statusCode == 200) {
        print(response.data.toString());
        return (response.data["results"] as List)
            .map<Atividade>((json) => Atividade.fromJson(json))
            .toList();
      } else {
        return Future.error('Failed to load');
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
