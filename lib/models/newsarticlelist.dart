import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/models/newsarticle.dart';
import 'package:mvvm_news_flutter/services/web_service.dart';
import 'package:mvvm_news_flutter/viewmodels/news_articles_vm.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  List<NewsArticleViewModel> articles = List.empty(
    growable: true,
  );
  LoadingStatus loadingStatus = LoadingStatus.empty;

  void topCountryCategoryHeadlines({String country, String category}) async {
    List<NewsArticle> newsArticles =
        await WebService().fetchTopHeadlinesCountryCategory(
      country: country,
      category: category,
    );
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
