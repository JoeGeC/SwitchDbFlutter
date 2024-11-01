import 'package:dartz/dartz.dart';
import 'package:switch_db/src/core/network/failure/failure.dart';
import 'package:switch_db/src/features/games/domain/models/game_model.dart';
import 'package:switch_db/src/features/games/domain/models/games_params.dart';
import 'package:switch_db/src/features/games/domain/repositories/GamesRepository.dart';
import '../../../../core/utils/usecases/usecase.dart';

class GamesUseCase extends UseCase<List<GameModel>, GamesParams> {
  final GamesRepository repository;

  GamesUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameModel>>> call(GamesParams params) async {
    final result = await repository.getGames(params);
    return result.fold((l){
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }

}
