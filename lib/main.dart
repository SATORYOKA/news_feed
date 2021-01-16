import 'package:flutter/material.dart';
import 'package:news_feed/viewmodels/news_list_viewmodels.dart';
import 'package:news_feed/views/screens/home_screen.dart';
import 'package:news_feed/views/screens/pages/news_list_page.dart';
import 'package:news_feed/views/style/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<NewsListViewModel>(
    create: (context) => NewsListViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeed',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}
