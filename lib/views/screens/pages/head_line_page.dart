import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/viewmodels/head_line_viewmodels.dart';
import 'package:news_feed/views/components/head_line_item.dart';
import 'package:news_feed/views/components/page_transfomer.dart';
import 'package:provider/provider.dart';

import 'news_web_screen_page.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HeadLineViewModel>(context, listen: false);
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }
    return SafeArea(
        child: Scaffold(
            body: Consumer<HeadLineViewModel>(builder: (context, model, child) {
              if (model.isLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return PageTransformer(
                  pageViewBuilder: (context, pageVisibilityResolver) {
                    return PageView.builder(
                      itemCount: model.articles.length,
                      controller: PageController(viewportFraction: 0.85),
                      itemBuilder: (context, index) {
                        final article = model.articles[index];
                        final pageVisibility =
                            pageVisibilityResolver.resolvePageVisibility(index);
                        final visibleFraction = pageVisibility.visibleFraction;
                        return HeadLineItem(
                          article: model.articles[index],
                          pageVisibility: pageVisibility,
                          onArticleClicked: (article) =>
                              _openArticleWebPage(context, article),
                        );
                      },
                    );
                  },
                );
              }
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: () => onRefresh(context),
              child: Icon(Icons.refresh),
            )));
  }

  onRefresh(BuildContext context) async {
    final viewModel = Provider.of<HeadLineViewModel>(context, listen: false);
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);

    print('headLinePage.onRefresh');
  }

  _openArticleWebPage(BuildContext context, Article article) {
    print('HeadLinePage._openArticleWebPage: ${article.url}');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsWebPageScreen(article: article),
    ));
  }
}
