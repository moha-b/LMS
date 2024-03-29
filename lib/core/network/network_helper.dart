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
      var token = SharedHelper.instance?.readString(CachingKey.TOKEN);
      options.headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Accept-Language': 'en',
      };
    }
    return options;
  }

  Future<void> downloadFile({
    required String fileUrl,
    required String savePath,
    bool withToken = true,
  }) async {
    try {
      Options options = await _configureOptions(withToken);
      await _dio.download(fileUrl, savePath, options: options);
    } catch (error) {
      print('Download error: $error');
    }
  }
}
