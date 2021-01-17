import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/viewmodels/head_line_viewmodels.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HeadLineViewModel>(context, listen: false);
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }
    return SafeArea(
        child: Scaffold(
            body: Container(
              child: Center(child: Text('headline')),
            ),
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
}
