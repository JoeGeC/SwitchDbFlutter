import 'package:switch_db/src/features/games/domain/models/games_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure/failure.dart';
import '../models/game_model.dart';

abstract class GamesRepository{
  Future<Either<Failure, List<GameModel>>> getGames(GamesParams params);
}