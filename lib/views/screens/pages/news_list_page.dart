import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/viewmodels/news_list_viewmodels.dart';
import 'package:news_feed/views/components/search_bar.dart';
import 'package:news_feed/views/components/category_tips.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: '更新',
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // //検索ワード
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              // //カテゴリ選択チップス
              CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category),
              ),
              //記事表示
              Expanded(child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }

  //記事更新処理
  Future<void> onRefresh(BuildContext context) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
    print('onRefresh');
  }

  //キーワード記事取得処理
  Future<void> getKeywordNews(BuildContext context, keyword) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
    print('getKeywordNews');
  }

  //カテゴリ取得
  Future<void> getCategoryNews(BuildContext context, Category category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
    // print(
    //     'NewsListPage.CategoryNews / category: ${category.nameJp} / ${category.nameEn}');
  }
}