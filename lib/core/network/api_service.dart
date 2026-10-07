import 'package:dio/src/dio_exception.dart';
import 'package:kickly/core/network/api_errors.dart';
import 'package:kickly/core/network/api_exceptions.dart';
import 'package:kickly/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();

  ///CRUD METHOD

  //GET
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //PoST
  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //PUT
  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //DELETE
  Future<dynamic> delete(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
