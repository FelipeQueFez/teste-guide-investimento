import 'package:dio/dio.dart';

class CoreHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //TODO:in development
    // options.headers.addAll({
    //   'Access-Control-Allow-Origin': '*',
    //   'Access-Control-Allow-Headers': '*',
    //   'Access-Control-Expose-Headers': "" 'Authorization, authenticated',
    //   'Access-Control-Allow-Methods': 'GET,POST,OPTIONS,DELETE,PUT',
    //   'Content-Type': 'application/json',
    // });

    handler.next(options);
  }
}
