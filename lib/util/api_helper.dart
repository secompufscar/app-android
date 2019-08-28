import 'package:app_secomp/models/atividade.dart';
import 'package:app_secomp/models/news.dart';
import 'package:app_secomp/credentials.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIHelper {
  Future<List<News>> getNewsList() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=" + API_KEY;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return parseNews(response.body);
    } else {
      throw Exception('Failed to load');
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
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return parseAtividades(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  List<Atividade> parseAtividades(String body) {
    final parsed = json.decode(body);
    return (parsed["results"] as List)
        .map<Atividade>((json) => Atividade.fromJson(json))
        .toList();
  }
}
