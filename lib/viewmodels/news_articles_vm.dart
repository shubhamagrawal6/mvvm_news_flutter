import 'package:intl/intl.dart';
import 'package:mvvm_news_flutter/models/newsarticle.dart';

class NewsArticleViewModel {
  NewsArticle _newsarticle;

  NewsArticleViewModel({NewsArticle article}) {
    _newsarticle = article;
  }

  String get title {
    return _newsarticle.title;
  }

  String get author {
    return _newsarticle.author;
  }

  String get description {
    return _newsarticle.description;
  }

  String get url {
    return _newsarticle.url;
  }

  String get urlToImage {
    return _newsarticle.urlToImage;
  }

  String get publishedAt {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ')
        .parse(_newsarticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }

  String get content {
    return _newsarticle.content;
  }
}
