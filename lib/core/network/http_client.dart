import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_library_app/core/constants/api_constants.dart';
import 'package:open_library_app/core/errors/app_exception.dart';

class HttpClient {
  const HttpClient();

  Future<Map<String, dynamic>> getJson(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'FlutterOpenLibraryApp/0.1 (work@rautenstengel.eu)',
              ...?headers,
            },
          )
          .timeout(
            const Duration(seconds: ApiConstants.requestTimeoutDuration),
          );

      _validateResponse(response);

      final dynamic decodedBody = jsonDecode(response.body);

      if (decodedBody is! Map<String, dynamic>) {
        throw const AppException('Unexpected response format.');
      }

      return decodedBody;
    } on FormatException {
      throw const AppException('Invalid JSON response.');
    } on http.ClientException catch (e) {
      throw AppException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppException('Unexpected error: $e');
    }
  }

  void _validateResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return;
      default:
        throw AppException(
          'Request failed with status code ${response.statusCode}.',
        );
    }
  }
}
