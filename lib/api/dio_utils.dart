import 'package:dio/dio.dart';
import 'package:jx3_app/constants/index.dart';

class DioUtils {
  DioUtils._internal() {
    _dio
      ..options.baseUrl = "https://www.mythosma.com/rust-jx3-server/"
      ..options.connectTimeout =
          const Duration(seconds: GlobalConstants.DEFAULT_TIMEOUT)
      ..options.receiveTimeout =
          const Duration(seconds: GlobalConstants.DEFAULT_TIMEOUT);
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
  }) {
    return _handleResponse(_dio.get(path, queryParameters: queryParameters));
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _handleResponse(_dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    ));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> result = await task;
      final data = result.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['data'];
      }
      throw Exception(data['message'] ?? '接口发生错误');
    } catch (e) {
      throw Exception(e);
    }
  }
}
