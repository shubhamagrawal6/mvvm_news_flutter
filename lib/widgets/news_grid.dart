import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/screens/news_article_details.dart';
import 'package:mvvm_news_flutter/viewmodels/news_articles_vm.dart';
import 'package:mvvm_news_flutter/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsGrid({this.articles});
  void _showArticleDetails(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return NewsArticleDetailScreen(article: article);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: CircleImage(
                imageUrl: article.urlToImage,
              ),
            ),
            footer: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
