import 'package:shared_preferences/shared_preferences.dart';

class GamesSharedPrefs {
  final SharedPreferences _preferences;

  GamesSharedPrefs(this._preferences);

  Future<bool> clearAllLocalData() async {
    return true;
  }
}
