import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/models/newsarticlelist.dart';
import 'package:mvvm_news_flutter/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "News",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                color: Color(0xff120a8f),
                height: 8,
                thickness: 8,
                indent: 10,
              ),
            ],
          ),
          actions: <Widget>[
            Icon(Icons.more_vert),
          ],
        ),
        body: NewsGrid(
          articles: listViewModel.articles,
        ),
      ),
    );
  }
}
