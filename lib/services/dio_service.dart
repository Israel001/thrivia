// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/common/exceptions.dart';

class DioService {
  late final Dio _dio;
  final logger = getLogger("DioService");

  String logAPIResponse(Response<dynamic> response) {
    final requestOptions = response.requestOptions;
    return ('''\n
        Request options:
        url:${requestOptions.uri}
        headers:${requestOptions.headers}
        data:${requestOptions.data}
        
        Response: 
        data: ${response.data}
        statusCode: ${response.statusCode}
        statusMessage: ${response.statusMessage}
        ''');
  }

  Dio get dio => _dio;
  DioService() {
    _dio = Dio(BaseOptions(
      validateStatus: (status) => true,
    ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            // Do something before request is sent.
            // If you want to resolve the request with custom data,
            // you can resolve a `Response` using `handler.resolve(response)`.
            // If you want to reject the request with a error message,
            // you can reject with a `DioException` using `handler.reject(dioError)`.
            return handler.next(options);
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            logger.d(logAPIResponse(response));
            if (response.statusCode == 500) {
              throw BackendException(
                  message: response.data.toString(),
                  devDetails: response.statusMessage,
                  prettyDetails: "An error occured on the server");
            }
            return handler.next(response);
          },
          onError: (DioException error, ErrorInterceptorHandler handler) {
            // Do something with response error.
            // If you want to resolve the request with some custom data,
            // you can resolve a `Response` object using `handler.resolve(response)`.
            if (error.error is BackendException) {
              throw error.error!;
            }
            return handler.next(error);
          },
        ),
      );
  }
}
