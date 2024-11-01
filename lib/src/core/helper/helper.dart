class Helper {

  static Map<String, dynamic> getDioHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }
}
