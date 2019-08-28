import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/news.dart';
import 'package:app_secomp/credentials.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class APIHelper {
  Dio dio = new Dio()
    ..interceptors.add(DioCacheManager(CacheConfig()).interceptor);

  Future<List<News>> getNewsList() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=" + API_KEY;
    final response = await dio.get(
      url,
      options: buildCacheOptions(
        Duration(days: 7),
      ),
    );

    if (response.statusCode == 200) {
      return (response.data["articles"] as List)
        .map<News>((json) => new News.fromJson(json))
        .toList();
    } else {
      return Future.error('Failed to load');
    }
  }

  List<News> parseNews(String body) {
    final parsed = json.decode(body);
    return (parsed["articles"] as List)
        .map<News>((json) => new News.fromJson(json))
        .toList();
  }

  Future<List<Atividade>> getAtividades() async {
    String url = BASE_URL + "/api/atividades/10";
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
      throw Future.error('Failed to load');
    }
  }
}
