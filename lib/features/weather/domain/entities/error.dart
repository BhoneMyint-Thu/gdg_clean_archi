import 'package:dio/dio.dart';

class ErrorModel {
  final int? statusCode;
  final String? message;
  ErrorModel({this.message, this.statusCode});
  Map<String, dynamic> toJson() {
    return {'status_code': statusCode, 'message': message};
  }

  factory ErrorModel.somethingWentWrong() =>
      ErrorModel(statusCode: -1, message: "Oops...Error occured.");

  factory ErrorModel.dio(DioException e) {
    final data = e.response?.data;
    final statusCode = e.response?.statusCode ?? -1;

    String? extractedMessage;

    if (data is Map<String, dynamic>) {
      // 1. Try top-level message
      extractedMessage = data["message"];

      // 2. Try nested errors.message
      extractedMessage ??= data["errors"]?["message"];

      // 3. Try field-specific validation error (e.g., phone)
      if (extractedMessage == null && data["errors"] is Map<String, dynamic>) {
        final errors = data["errors"] as Map<String, dynamic>;
        for (final value in errors.values) {
          if (value is List && value.isNotEmpty) {
            extractedMessage = value.first.toString();
            break;
          } else if (value is String) {
            extractedMessage = value;
            break;
          }
        }
      }

      // 4. Fallback to generic error
      extractedMessage ??= data["error"];
    }

    // 5. Final fallback
    extractedMessage ??= "Oops...Error occured.";

    return ErrorModel(statusCode: statusCode, message: extractedMessage);
  }
}
