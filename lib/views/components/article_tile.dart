import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/views/components/image_form_url.dart';

class ArticleTile extends StatelessWidget {
  final article;

  final ValueChanged onArticleClicked;

  const ArticleTile({this.article, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  // child: ImageFromUrl(
                  //   imageUrl: article.urlToImage,
                  // ),
                  child: Image.network(article.urlToImage),
                ),
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
      ),
    );
  }
}
