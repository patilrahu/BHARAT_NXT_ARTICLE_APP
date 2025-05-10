import 'package:bharat_nxt_article_app/api/app_url.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppUrl.baseUrl,
          ),
        );

  Future<Map<String, dynamic>> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(endpoint,
          queryParameters: {
            ...?queryParameters,
          },
          options: Options(
            headers: await setHeaders(),
            validateStatus: (status) => true,
          ));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, String>> setHeaders() async {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';

    return headers;
  }

  Map<String, dynamic> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return {
          'status': response.statusCode,
          'data': response.data,
        };
      default:
        return {
          'status': response.statusCode,
          'data': response.data,
        };
    }
  }

  Map<String, dynamic> _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return {'status': false, 'message': 'Connection Timeout'};
        case DioExceptionType.sendTimeout:
          return {'status': false, 'message': 'Send Timeout'};
        case DioExceptionType.receiveTimeout:
          return {'status': false, 'message': 'Receive Timeout'};
        case DioExceptionType.cancel:
          return {'status': false, 'message': 'Request Cancelled'};
        case DioExceptionType.badResponse:
          return {
            'status': false,
            'message': 'Error: ${error.response?.statusCode ?? 'Unknown'}',
            'details': error.response?.data
          };
        case DioExceptionType.connectionError:
          return {'status': false, 'message': 'Connection Error'};
        default:
          return {
            'status': false,
            'message': 'Unexpected Error: ${error.message}'
          };
      }
    }
    return {'status': false, 'message': 'Unknown Error'};
  }
}
