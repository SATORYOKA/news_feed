import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final article;

  final ValueChanged onArticleClicked;

  const ArticleTile({this.article, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(article.title),
                    Text(article.publishedDate),
                    Text(article.description),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
