import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/views/components/lazy_load_text.dart';
import 'package:news_feed/views/components/page_transfomer.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;

  HeadLineItem({this.article, this.pageVisibility, this.onArticleClicked});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      // height: 300,
      // width: 100,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4.0,
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Container(
              //   constraints: BoxConstraints.expand(),
              //   child: Image.network(
              //     article.urlToImage,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.black26],
                  ),
                ),
                child: Image.network(article.urlToImage),
              ),
              Positioned(
                  bottom: 56,
                  right: 32,
                  left: 32,
                  child: LazyLoadText(
                    text: article.title,
                    pageVisibility: pageVisibility,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
