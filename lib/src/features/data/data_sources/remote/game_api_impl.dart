import 'package:switch_db/src/features/data/data_sources/remote/abstract_game_api.dart';
import 'package:switch_db/src/features/domain/models/game_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/error/cancel_token_exception.dart';
import '../../../../core/network/error/dio_exception_handler.dart';
import '../../../../core/network/error/server_exception.dart';
import '../../../domain/models/api_response.dart';
import '../../../domain/models/games_params.dart';

class GameApiImpl extends GameApi {
  final Dio dio;

  GameApiImpl(this.dio);

  @override
  Future<ApiResponse<List<GameModel>>> getGames(GamesParams params) async {
    try {
      final result = (await dio.get(""));
      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }
      return ApiResponse.fromJson<List<GameModel>>(
        result.data, GameModel.fromJsonList);
    } on DioException catch (e){
      if(e.type == DioExceptionType.cancel){
        throw CancelTokenException(handleDioException(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioException(e), e.response?.statusCode);
      }
    } on ServerException { rethrow; } catch (e){
      throw ServerException(e.toString(), null);
    }
  }

}