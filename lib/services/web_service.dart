import 'package:dio/dio.dart';
import 'package:mvvm_news_flutter/models/newsarticle.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bba7a2055ebc4f2b95e0278ea12d7b71';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get News from API");
    }
  }
}
