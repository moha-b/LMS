part of 'network.dart';

class NetworkHelper {
  static NetworkHelper? instance;
  static Dio? _dio;

  NetworkHelper._internal() {
    _dio = Dio();
    _dio!.options.baseUrl = BASE_URL;
    _dio!.interceptors.add(PrettyDioLogger());
  }

  factory NetworkHelper(
      {String? urlCode, String? schema, bool change = false}) {
    instance ??= NetworkHelper._internal();
    return instance!;
  }

  Future<dynamic> get({
    required String endPoint,
    Mapper? model,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers = const {
      'Authorization': 'Bearer --TOKEN--',
      'Accept': 'application/json',
      'Accept-Language': 'en'
    },
  }) async {
    Response? response;
    _dio!.options.headers = headers;

    try {
      response = await _dio!.get(endPoint, queryParameters: query);
    } on DioException catch (e) {
      response = e.response;
      if (response == null) {
        return Response(
          data: {"status": 0, "message": "NO INTERNET"},
          requestOptions: RequestOptions(),
        );
      }
    }

    if (model == null) {
      return response;
    } else {
      return Mapper(model, response.data);
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required Object? body,
    Mapper? model,
    Map<String, dynamic>? headers = const {
      'Authorization': 'Bearer --TOKEN--',
      'Accept': 'application/json',
      'Accept-Language': 'en'
    },
  }) async {
    Response? response;
    try {
      _dio!.options.headers = headers;
      response = await _dio!.post(endPoint, data: body);
    } on DioException catch (_) {
      if (response == null) {
        return Response(
          data: {"status": 0, "message": "NO INTERNET"},
          requestOptions: RequestOptions(),
        );
      } else if (model == null) {
        return response;
      } else {
        return Mapper(model, response.data);
      }
    }
    if (model == null) {
      return response;
    } else {
      return Mapper(model, response.data);
    }
  }
}
