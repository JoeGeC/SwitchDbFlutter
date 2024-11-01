import '../../core/network/dio_network.dart';
import '../../core/utils/injections/injections.dart';
import 'data/data_sources/local/games_shared_prefs.dart';
import 'data/data_sources/remote/game_api_impl.dart';
import 'data/repositories/GamesRepositoryImpl.dart';
import 'domain/usecases/games_usecase.dart';

initGamesInjections() {
  getIt.registerSingleton(GamesApiImpl(DioNetwork.appAPI));
  getIt.registerSingleton(GamesSharedPrefs(getIt()));
  getIt.registerSingleton(GamesUseCase(getIt()));
  getIt.registerSingleton(GamesRepositoryImpl(getIt()));
}