// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://newsapi.org/v2/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getTopNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/top-headlines?country=us&apiKey=a9129339867d4a2c9be27e11b9ec0fca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseEntity.fromJson(_result.data);
    return value;
  }

  @override
  searchNews(searchQuery) async {
    ArgumentError.checkNotNull(searchQuery, 'searchQuery');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': searchQuery};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/top-headlines?country=us&apiKey=a9129339867d4a2c9be27e11b9ec0fca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseEntity.fromJson(_result.data);
    return value;
  }

  @override
  getLatestNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/everything?language=en&sortBy=publishedAt&q=a&apiKey=a9129339867d4a2c9be27e11b9ec0fca',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseEntity.fromJson(_result.data);
    return value;
  }
}
