import 'package:dio/dio.dart';

class Dioerrorhelper {
  static String handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again.";
      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond.";
      case DioExceptionType.badResponse:
        return "Invalid email or password.";
      case DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "Something went wrong. Please try again.";
    }
  }
}
