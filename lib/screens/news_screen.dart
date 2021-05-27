import 'package:flutter/material.dart';
import 'package:mvvm_news_flutter/constants.dart';
import 'package:mvvm_news_flutter/models/newsarticlelist.dart';
import 'package:mvvm_news_flutter/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String category = "General", country = "USA";
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    void setCategoryCountry() {
      listViewModel.topCountryCategoryHeadlines(
        category: Constants.Categories[category],
        country: Constants.Countries[country],
      );
    }

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
            PopupMenuButton(
              onSelected: (cat) {
                category = cat;
                setCategoryCountry();
              },
              icon: Icon(Icons.category),
              itemBuilder: (_) {
                return Constants.Categories.keys
                    .map((v) => PopupMenuItem(
                          value: v,
                          child: Text(v),
                        ))
                    .toList();
              },
            ),
            PopupMenuButton(
              onSelected: (con) {
                country = con;
                setCategoryCountry();
              },
              icon: Icon(Icons.flag),
              itemBuilder: (_) {
                return Constants.Countries.keys
                    .map((v) => PopupMenuItem(
                          value: v,
                          child: Text(v),
                        ))
                    .toList();
              },
            ),
          ],
        ),
        body: NewsGrid(
          articles: listViewModel.articles,
        ),
      ),
    );
  }
}
