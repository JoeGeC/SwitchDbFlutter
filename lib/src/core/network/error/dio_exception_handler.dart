import 'package:dio/dio.dart';

String _unknownError = "Unknown Error";

String handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      return "Request to API server was cancelled";
    case DioExceptionType.connectionTimeout:
      return "Connection timeout with API server";
    case DioExceptionType.connectionTimeout:
      return "Internet Connection Problem.";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout in connection with API server";
    case DioExceptionType.badResponse:
      return _handleBadResponse(error);
    case DioExceptionType.sendTimeout:
      return "Send timeout in connection with API server";
    case DioExceptionType.badCertificate:
      return "Bad certificate from API";
    case DioExceptionType.connectionError:
      return "Connection error";
    case DioExceptionType.unknown:
      return "Unknown error occurred";
  }
}

String _handleBadResponse(DioException error) {
  var responseData = error.response?.data;
  if (responseData?['code'] != "0") {
    return responseData?['msg'];
  }
  var faultString = responseData['fault']['faultstring'];
  var statusCode = error.response?.statusCode;
  var responseStatusCode = responseData["statusCode"]?.toString() ?? "0";

  switch(statusCode){
    case 200:
      if(responseStatusCode != "0") {
        return faultString?.isNotEmpty == true ? faultString : _unknownError;
      }
    case 422:
      return _handle422Status(error);
    case 413:
      return error.response!.statusMessage ?? "";
    case 400:
    case 401:
      return faultString ?? _unknownError;
    case 403:
      return responseData is String
          ? "403 Forbidden"
          : faultString ?? _unknownError;
    case 404:
      return responseData is String
          ? "404 Unknown Error"
          : faultString ?? _unknownError;
    case 409:
      return "$faultString,\n Minutes left to join: ${responseData["data"]["mins_to_join"]?.toString() ?? _unknownError}";
    case 429:
      return faultString;
  }
  return "Received invalid status code: $statusCode";
}

String _handle422Status(DioException error) {
  var responseData = error.response?.data;
  var responseDataData = responseData["data"];
  var responseDataValidations = responseDataData["validations"];
  return (responseDataData != null && responseDataValidations != null)
      ? responseDataValidations.values.first[0]
      : responseData["errors"] == null
          ? responseData['fault']['faultstring'] ?? "Unknown Error"
          : responseData["errors"].values.first[0] ??
              responseData['fault']['faultstring'] ?? "Unknown Error";
}
