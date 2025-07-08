import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../utils/utils.dart';

abstract class BaseService {
  final Dio dio;

  BaseService(this.dio);

  Future<void> setupHeaders() async {
    if (!dio.interceptors.any((i) => i.runtimeType == LogInterceptor)) {
      dio.interceptors.add(Utils.getLoggingInterceptor());
    }
  }

  Future<T> safeRequest<T>(
    Future<T> Function() request, {
    required T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      await setupHeaders();
      final result = await request();
      return result;
    } on DioException catch (e) {
      log("DioException caught in safeRequest:$e");
      log("Status Code: ${e.response?.statusCode}");
      log("Response Data: ${e.response?.data}");
      // Handle connection error (no internet, DNS fail, etc.)
      if (e.type == DioExceptionType.connectionError) {
        if (fromJson != null) {
          log("Connection error occurred");
          return fromJson({
            "status": "NotOk",
            'message':
                'Unable to connect to the server. Please check your internet connection or try again later.',
          });
        }
      }

      if (e.response?.data is Map<String, dynamic> && fromJson != null) {
        return fromJson({
          'success': false,
          'message': '${e.response!.data['detail']}',
        });
      }
      throw Exception("API Error: ${e.message}");
    } catch (e, stackTrace) {
      log("Unexpected error in safeRequest: $e\n$stackTrace");
      throw Exception("Something went wrong: $e");
    }
  }
}
