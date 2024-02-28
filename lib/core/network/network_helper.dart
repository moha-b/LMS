part of 'network.dart';

class NetworkHelper {
  late final Dio _dio;

  NetworkHelper._() : _dio = _configureDio();

  static final NetworkHelper instance = NetworkHelper._();

  factory NetworkHelper() => instance;

  static Dio _configureDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.get(endPoint,
        queryParameters: params, options: await _configureOptions(withToken));
    return response;
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.post(endPoint,
        data: data,
        queryParameters: params,
        options: await _configureOptions(withToken));
    return response;
  }

  Future<Options> _configureOptions(bool withToken) async {
    Options options = Options();
    if (withToken) {
      var token = "18|fOww1AdIwHuXQ0qKXHtJMQUU4v8TMJNz41nb56IC";
      options.headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Accept-Language': 'en',
      };
    }
    return options;
  }
}
