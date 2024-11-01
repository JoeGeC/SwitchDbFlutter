import 'package:bloc/bloc.dart';
import 'package:switch_db/src/features/games/domain/models/game_model.dart';
import 'package:switch_db/src/features/games/domain/models/games_params.dart';
import 'package:switch_db/src/features/games/domain/usecases/games_usecase.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GamesUseCase gamesUseCase;

  GamesBloc({required this.gamesUseCase}) : super(LoadingGetGamesState()){
    on<OnGettingGamesEvent>(_onGettingGamesEvent);
  }

  _onGettingGamesEvent(
      OnGettingGamesEvent event, Emitter<GamesState> emitter) async {
    if(event.withLoading){
      emitter(LoadingGetGamesState());
    }

    final result = await gamesUseCase.call(GamesParams(name: event.name));
    result.fold((l) {
      emitter(ErrorGetGamesState(l.errorMessage));
    }, (r) {
      emitter(SuccessGetGamesState(r));
    });
  }


}