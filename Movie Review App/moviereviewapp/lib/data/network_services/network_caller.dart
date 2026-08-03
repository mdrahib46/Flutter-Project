import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'network_response.dart';

/// On Error Response form API
// {
// "status_code": 7,
// "status_message": "Invalid API key: You must be granted a valid key.",
// "success": false
// }

class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String, String> Function() headers;

  NetworkCaller({required this.headers});

  /// Get Request
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, headers: headers());

      final Response response = await get(uri, headers: headers());

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodeResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: decodeResponse,
        );
      } else {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedResponse['status_message'],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }



  /// Post Request
  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, headers: headers(), requestBody: body);

      final Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: headers(),
      );

      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final encodedResponse = response.body;

        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: encodedResponse,
        );
      } else {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedResponse['status_message'],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? headers,
  }) {
    _logger.d("""
      Url:=> $url,
      Header:=> $headers,
      Request Body:=> $requestBody
    """);
  }

  void _logResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      _logger.i("""
        Url:=> ${response.request?.url},
        Header:=> ${response.request?.headers},
        Response Body:=> ${response.body}
      """);
    } else {
      _logger.e('''
      Url => ${response.request?.url}
      Headers => ${response.headers}
      Response Body => ${response.body} 
    ''');
    }
  }
}
