import 'package:switch_db/src/features/games/domain/models/api_response.dart';
import 'package:switch_db/src/features/games/domain/models/game_model.dart';
import 'package:switch_db/src/features/games/domain/models/games_params.dart';

abstract class GamesApi {
  Future<ApiResponse<List<GameModel>>> getGames(GamesParams params);
}