import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/views/style/style.dart';

class ArticleTileDesc extends StatelessWidget {
  final Article article;
  const ArticleTileDesc({this.article});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    var displayDesc = "";

    if (article.description != null) {
      displayDesc = article.description;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          article.title,
          style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          article.publishedDate,
          style: textTheme.subtitle1.copyWith(fontStyle: FontStyle.italic),
        ),
        Text(
          article.description,
          style: textTheme.subtitle1.copyWith(fontFamily: RegularFont),
        ),
      ],
    );
  }
}
