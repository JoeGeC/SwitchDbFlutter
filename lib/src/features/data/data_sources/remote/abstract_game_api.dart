import 'package:switch_db/src/features/domain/models/api_response.dart';
import 'package:switch_db/src/features/domain/models/game_model.dart';
import 'package:switch_db/src/features/domain/models/games_params.dart';

abstract class GameApi {
  Future<ApiResponse<List<GameModel>>> getGames(GamesParams params);
}