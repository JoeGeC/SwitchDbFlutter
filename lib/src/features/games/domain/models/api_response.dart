import 'package:flutter/foundation.dart';

class ApiResponse<T> {
  ApiResponse({
    required this.results,
  });

  late final T? results;

  static fromJson<T>(List<dynamic> json, Function tFromJson) {
    return ApiResponse<T>(
      results: tFromJson(json),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is ApiResponse) {
      return other.results is List
          ? listEquals(other.results, results as List)
          : other.results == results;
    }
    return false;
  }
}
