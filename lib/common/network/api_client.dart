import 'dart:convert';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  ApiClient._internal();

  final String baseUrl = ApiConstants.baseUrl;

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(
        '$baseUrl$endpoint',
      ));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> patch(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  String _handleError(dynamic error) {
    if (error is http.ClientException) {
      return 'Network error: ${error.message}';
    } else {
      return error.toString();
    }
  }
}
