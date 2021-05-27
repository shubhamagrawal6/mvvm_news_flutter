import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/viewmodels/news_articles_vm.dart';
import 'package:mvvm_news_flutter/widgets/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticleDetailScreen({@required this.article});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Container(
            constraints: BoxConstraints(
              maxWidth: 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Author",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  this.article.author ?? "Anonymous",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 15.0,
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Divider(
                    height: 80,
                    thickness: 20,
                    color: Color(0xff120a8f),
                  ),
                  Text(
                    " Headline",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                this.article.title ?? "Not Found",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                this.article.publishedAt ?? "Unknown",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: CircleImage(
                  imageUrl: this.article.urlToImage,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                this.article.description ?? "No Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  wordSpacing: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
