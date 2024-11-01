import 'package:dartz/dartz.dart';
import 'package:switch_db/src/core/network/error/cancel_token_exception.dart';
import 'package:switch_db/src/core/network/error/server_exception.dart';
import 'package:switch_db/src/core/network/failure/cancel_token_failure.dart';
import 'package:switch_db/src/core/network/failure/failure.dart';
import 'package:switch_db/src/core/network/failure/server_failure.dart';
import 'package:switch_db/src/features/games/domain/models/game_model.dart';
import 'package:switch_db/src/features/games/domain/models/games_params.dart';
import '../../domain/repositories/GamesRepository.dart';
import '../data_sources/remote/game_api_impl.dart';

class GamesRepositoryImpl extends GamesRepository {
  final GamesApiImpl gamesApi;

  GamesRepositoryImpl(this.gamesApi);

  @override
  Future<Either<Failure, List<GameModel>>> getGames(GamesParams params) async {
    try {
      final result = await gamesApi.getGames(params);
      return Right(result.results ?? []);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

}