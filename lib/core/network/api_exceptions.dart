import 'package:dio/dio.dart';
import 'package:kickly/core/network/api_errors.dart';

class ApiExceptions {
  static ApiErrors handleError(DioException error) {
    final statusCode = error.response?.statusCode;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrors(
          detail: 'Connection timeout. Please try again.',
          statusCode: statusCode,
        );

      case DioExceptionType.sendTimeout:
        return ApiErrors(
          detail: 'Sending request timed out. Please try again.',
          statusCode: statusCode,
        );

      case DioExceptionType.receiveTimeout:
        return ApiErrors(
          detail: 'Server response timed out. Please try again.',
          statusCode: statusCode,
        );

      case DioExceptionType.connectionError:
        return ApiErrors(
          detail: 'No internet connection. Please check your network.',
          statusCode: statusCode,
        );

      case DioExceptionType.badCertificate:
        return ApiErrors(
          detail: 'Secure connection failed.',
          statusCode: statusCode,
        );

      case DioExceptionType.badResponse:
        return ApiErrors(
          detail: _getResponseMessage(error),
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return ApiErrors(
          detail: 'Request was cancelled.',
          statusCode: statusCode,
        );

      case DioExceptionType.unknown:
        return ApiErrors(
          detail: error.message ?? 'An unexpected error occurred.',
          statusCode: statusCode,
        );
      case DioExceptionType.transformTimeout:
        return ApiErrors(
          detail: 'Response processing timed out.',
          statusCode: statusCode,
        );
    }
  }

  static String _getResponseMessage(DioException error) {
    final data = error.response?.data;

    if (data is Map) {
      // ASP.NET Core validation errors
      final errors = data['errors'];

      if (errors is Map) {
        final messages = <String>[];

        for (final value in errors.values) {
          if (value is List) {
            messages.addAll(value.map((e) => e.toString()));
          } else if (value != null) {
            messages.add(value.toString());
          }
        }

        if (messages.isNotEmpty) {
          return messages.join('\n');
        }
      }

      // Common API error message fields
      for (final key in ['message', 'detail', 'title', 'error']) {
        final value = data[key];

        if (value is String && value.isNotEmpty) {
          return value;
        }
      }
    }

    if (data is String && data.isNotEmpty) {
      return data;
    }

    return error.message ?? 'Request failed. Please try again.';
  }
}
