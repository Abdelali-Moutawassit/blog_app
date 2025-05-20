import 'package:dio/dio.dart';
import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points.dart';
import 'package:blog_app/core/errors/expentions.dart';
import 'dart:io';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baserUrl;
  }

//!POST
  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioException(e);
    }
  }


//!GET
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!DELETE
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!PATCH
  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
  
  //! POST Login
  @override
  Future postLogin(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final body = isFormData ? FormData.fromMap(data) : data;

      final response = await dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: isFormData
                ? 'multipart/form-data'
                : 'application/json',
          },
        ),
      );
      return response.data; // ✅ Pour respecter le type Future<dynamic>
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
