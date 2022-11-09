import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../debug/is_debug_mode.dart';
import 'interceptors/core_header_interceptor.dart';

abstract class GuideRequesterInterface {
  Future delete(
      {required String url, body, required Function(dynamic p1) fromJson});
  Future fetch(
      {required String url, body, required Function(dynamic p1) fromJson});
  Future post(
      {required String url, body, required Function(dynamic p1) fromJson});
  Future put(
      {required String url, body, required Function(dynamic p1) fromJson});
}

class GuideRequester implements GuideRequesterInterface {
  static final GuideRequester _singleton = GuideRequester._internal();

  factory GuideRequester() {
    return _singleton;
  }

  GuideRequester._internal();

  Dio _setOptions(String url) {
    var dio = Dio();

    dio.interceptors.add(CoreHeaderInterceptor());

    if (isInDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        error: true,
        maxWidth: 90,
        compact: true,
      ));
    }

    dio.options.baseUrl = url;
    return dio;
  }

  @override
  Future delete(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.delete(url, data: body);
      },
    );
  }

  @override
  Future fetch(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.get(url);
      },
    );
  }

  @override
  Future post(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.post(url, data: body);
      },
    );
  }

  @override
  Future put(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.put(url, data: body);
      },
    );
  }

  Future _invokeRequest({
    required String url,
    required Function(dynamic p1) fromJson,
    required Future<Response<dynamic>> Function(Dio) invokeDio,
  }) async {
    var dio = _setOptions(url);

    late Response<dynamic> response;
    try {
      response = await invokeDio(dio);
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.response) {
          if (e.response?.data != null && e.response?.data is Map) {
            throw Exception(e.response?.toString());
          }
        }
      }
    }

    return fromJson(response.data);
  }
}
