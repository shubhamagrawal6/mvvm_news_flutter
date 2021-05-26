import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/viewmodels/news_articles_vm.dart';
import 'package:mvvm_news_flutter/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsGrid({this.articles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return GridTile(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: CircleImage(
              imageUrl: articles[index].urlToImage,
            ),
          ),
          footer: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              articles[index].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
