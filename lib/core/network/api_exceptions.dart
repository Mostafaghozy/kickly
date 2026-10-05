import 'package:kickly/core/network/api_errors.dart';
import 'package:dio/dio.dart';

class ApiExceptions {
  static ApiErrors handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrors(detail: "Connection timeout");
      case DioExceptionType.sendTimeout:
        return ApiErrors(detail: "Send timeout");

      case DioExceptionType.badResponse:
        return ApiErrors(detail: error.toString());
      default:
        return ApiErrors(detail: "Something went wrong");
    }
  }
}
