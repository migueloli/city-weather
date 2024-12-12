import 'dart:convert';
import 'package:city_weather/core/error/api_exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl;
  final Map<String, String> _defaultHeaders;

  ApiClient({
    required String baseUrl,
    Map<String, String> defaultHeaders = const {},
  }) : _defaultHeaders = defaultHeaders, _baseUrl = baseUrl;

  // GET Request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.get(uri, headers: {..._defaultHeaders, ...?headers});

    return _processResponse(response);
  }

  // POST Request
  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.post(
      uri,
      headers: {..._defaultHeaders, ...?headers},
      body: body is Map ? jsonEncode(body) : body,
    );

    return _processResponse(response);
  }

  // PUT Request
  Future<dynamic> put(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.put(
      uri,
      headers: {..._defaultHeaders, ...?headers},
      body: body is Map ? jsonEncode(body) : body,
    );

    return _processResponse(response);
  }

  // DELETE Request
  Future<dynamic> delete(String endpoint, {Map<String, String>? headers}) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.delete(uri, headers: {..._defaultHeaders, ...?headers});

    return _processResponse(response);
  }

  // Private method to handle HTTP responses
  dynamic _processResponse(http.Response response) {
    final statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    } else {
      throw ApiException(
        statusCode: statusCode,
        message: response.body.isNotEmpty
            ? jsonDecode(response.body)['message'] ?? 'An error occurred'
            : 'An error occurred',
      );
    }
  }
}
