import 'package:flutter/material.dart';
import 'package:news_feed/viewmodels/head_line_viewmodels.dart';
import 'package:news_feed/viewmodels/news_list_viewmodels.dart';
import 'package:news_feed/views/screens/home_screen.dart';
import 'package:news_feed/views/screens/pages/news_list_page.dart';
import 'package:news_feed/views/style/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HeadLineViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
