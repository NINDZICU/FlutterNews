import 'package:flutternews/data/api/entity/response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class ApiClient {
  static const _API_KEY = 'a9129339867d4a2c9be27e11b9ec0fca';
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/top-headlines?country=us&apiKey=$_API_KEY')
  Future<ResponseEntity> getTopNews();

  @GET('/top-headlines?country=us&apiKey=$_API_KEY')
  Future<ResponseEntity> searchNews(@Query("q") String searchQuery);

  @GET('/everything?language=en&sortBy=publishedAt&q=a&apiKey=$_API_KEY')
  Future<ResponseEntity> getLatestNews();

}

