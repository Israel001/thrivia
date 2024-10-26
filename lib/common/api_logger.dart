import 'package:dio/dio.dart';

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
