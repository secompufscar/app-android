import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    print('REQUEST[${options.method}] => ${options.path}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('RESPONSE[${response.statusCode}] => ${response.request.path}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.type != DioErrorType.DEFAULT) {
      print('ERROR[${err.response.statusCode}] => ${err.request.path}');
    } else {
      print('ERROR => ${err.message}');
    }
    return super.onError(err);
  }
}
