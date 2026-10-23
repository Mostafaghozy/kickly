import 'package:dio/dio.dart';
import 'package:kickly/core/network/api_errors.dart';

class ApiExceptions {
  static ApiErrors handleError(DioException error) {
    final statusCode = error.response?.statusCode;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrors(
          detail: 'Connection timed out. Please try again.',
          statusCode: statusCode,
        );

      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrors(
          detail: 'The request took too long. Please try again.',
          statusCode: statusCode,
        );

      case DioExceptionType.connectionError:
        return ApiErrors(
          detail: 'No internet connection. Please check your network.',
          statusCode: statusCode,
        );

      case DioExceptionType.badCertificate:
        return ApiErrors(
          detail: 'Unable to establish a secure connection.',
          statusCode: statusCode,
        );

      case DioExceptionType.badResponse:
        return ApiErrors(
          detail: _getResponseMessage(error),
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return ApiErrors(
          detail: 'The request was cancelled. Please try again.',
          statusCode: statusCode,
        );

      case DioExceptionType.unknown:
        return ApiErrors(
          detail: 'Something went wrong. Please try again later.',
          statusCode: statusCode,
        );

      case DioExceptionType.transformTimeout:
        return ApiErrors(
          detail: 'Something went wrong while processing the response.',
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
          return messages.map(_toUserFriendlyMessage).join('\n');
        }
      }

      // Common API error message fields
      for (final key in ['message', 'detail', 'title', 'error']) {
        final value = data[key];

        if (value is String && value.trim().isNotEmpty) {
          return _toUserFriendlyMessage(value);
        }
      }
    }

    if (data is String && data.trim().isNotEmpty) {
      return _toUserFriendlyMessage(data);
    }

    return 'Something went wrong. Please try again later.';
  }

  static String _toUserFriendlyMessage(String message) {
    final normalized = message.toLowerCase().trim();

    // Technical/backend configuration errors
    if (normalized.contains('application not found')) {
      return 'We couldn’t complete your request. Please try again later.';
    }

    // Authentication errors
    if (normalized.contains('invalid credentials') ||
        normalized.contains('invalid email or password') ||
        normalized.contains('incorrect password')) {
      return 'The email or password is incorrect. Please try again.';
    }

    if (normalized.contains('unauthorized')) {
      return 'Your session has expired. Please sign in again.';
    }

    // Registration errors
    if (normalized.contains('email already exists') ||
        normalized.contains('email is already registered') ||
        normalized.contains('email already registered')) {
      return 'This email is already registered. Please sign in instead.';
    }

    if (normalized.contains('phone number already exists') ||
        normalized.contains('phone number is already registered')) {
      return 'This phone number is already registered.';
    }

    // Generic server errors
    final statusCode = normalized;

    if (statusCode.contains('internal server error')) {
      return 'Something went wrong on our side. Please try again later.';
    }

    return message;
  }
}
