import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/viewmodels/news_articles_vm.dart';

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
            child: CachedNetworkImage(
              imageUrl: this.articles[index].urlToImage,
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
