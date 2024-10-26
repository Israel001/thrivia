// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class DioService {
  final Dio _dio;
  Dio get dio => _dio;
  DioService() : _dio = Dio();
}
