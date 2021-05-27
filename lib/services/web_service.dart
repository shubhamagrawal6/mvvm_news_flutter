import 'package:dio/dio.dart';
import 'package:mvvm_news_flutter/constants.dart';
import 'package:mvvm_news_flutter/models/newsarticle.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlinesCountryCategory(
      {String country, String category}) async {
    final response = await dio.get(Constants.headlinesFor(
      country: country,
      category: category,
    ));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get News from API");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await dio.get(Constants.top_headlines_URL);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get News from API");
    }
  }
}
