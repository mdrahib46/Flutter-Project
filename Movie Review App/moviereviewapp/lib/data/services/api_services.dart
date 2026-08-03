import 'dart:convert';

import 'package:http/http.dart';
import 'package:moviereviewapp/data/services/network_response.dart';


/// On Error Response form API
// {
// "status_code": 7,
// "status_message": "Invalid API key: You must be granted a valid key.",
// "success": false
// }

class NetworkCaller {
  final Map<String, String> Function() headers;

  NetworkCaller({required this.headers});

  /// Get Request
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      final Response response = await get(uri, headers: headers());

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

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      final Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: headers(),
      );

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
}
