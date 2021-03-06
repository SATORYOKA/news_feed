import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/networking/api_service.dart';

class NewsRepository {
  final ApiService _apiService = ApiService.create();

  Future<List<Article>> getNews({
    @required SearchType searchType,
    Category category,
    String keyword,
    bool isLoading,
  }) async {
    List<Article> result = List<Article>();

    Response response;

    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          response = await _apiService.getHeadLines();
          break;
        case SearchType.KEYWORD:
          response = await _apiService.getKeywordNews(keyword: keyword);
          break;
        case SearchType.CATEGORY:
          response =
              await _apiService.getCategoryNews(category: category.nameEn);
          break;
      }

      if (response.isSuccessful) {
        final responseBody = response.body;
        result = News.fromJson(responseBody).articles;
        print(responseBody);
      } else {
        final errorCode = response.statusCode;
        final error = response.error;
        print('errorCode: $errorCode, error: $error');
      }
    } on Exception catch (e) {
      print('Exception error: $e');
    }
    return result;
  }

  void dispose() {
    _apiService.dispose();
  }
}
