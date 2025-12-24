import 'package:dio/dio.dart';

class DioUtils {
  DioUtils._internal() {
    _dio
      ..options.baseUrl = "https://www.mythosma.com/rust-jx3-server/"
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10);
    // ⚠️ Web 上移除 sendTimeout（见下文说明）

    _addInterceptor();
  }

  static final DioUtils _instance = DioUtils._internal();
  static DioUtils getInstance() => _instance;

  final Dio _dio = Dio();

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 可在此添加 token、日志等
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode == 200) {
            handler.next(response);
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    final data = response.data as Map<String, dynamic>;
    return data['data'];
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    final result = response.data as Map<String, dynamic>;
    return result['data'];
  }
}
