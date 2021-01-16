import "dart:async";
import 'package:chopper/chopper.dart';

// this is necessary for the generated code to find your class
part "api_service.chopper.dart";

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = 'http://newsapi.org/v2';
  static const API_KEY = '242ea25cd1234f63acd908f2fa430616';

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Get(path: '/top-headlines')
  Future<Response> getHeadLines(
      {@Query("apiKey") String apiKey = ApiService.API_KEY,
      @Query("country") String country = 'jp',
      @Query("pageSize") int pageSize = 10});

  @Get(path: '/top-headlines')
  Future<Response> getKeywordNews({
    @Query("apiKey") String apiKey = ApiService.API_KEY,
    @Query("country") String country = 'jp',
    @Query("pageSize") int pageSize = 30,
    @Query("q") String keyword,
  });

  @Get(path: '/top-headlines')
  Future<Response> getCategoryNews({
    @Query("apiKey") String apiKey = ApiService.API_KEY,
    @Query("country") String country = 'jp',
    @Query("pageSize") int pageSize = 30,
    @Query("category") String category,
  });
}
