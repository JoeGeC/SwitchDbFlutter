import '../core/utils/injections/injections.dart';
import 'data/data_sources/app_shared_prefs.dart';

initAppInjections() {
  getIt.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(getIt()));
}
