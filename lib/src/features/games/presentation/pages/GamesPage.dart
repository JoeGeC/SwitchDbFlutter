import 'package:flutter/cupertino.dart';
import 'package:switch_db/src/features/games/domain/models/game_model.dart';
import 'package:switch_db/src/features/games/domain/usecases/games_usecase.dart';
import 'package:switch_db/src/features/games/presentation/bloc/games_bloc.dart';
import '../../../../core/utils/injections/injections.dart';

class GamesPage extends StatefulWidget{
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage>{
  final GamesBloc _bloc = GamesBloc(gamesUseCase: getIt<GamesUseCase>());
  List<GameModel> games = [];
  String selectedName = "";
  
  @override
  void initState(){
    callGames();
    super.initState();
  }

  callGames({bool withLoading = true}) {
    _bloc.add(
      OnGettingGamesEvent(
        selectedName,
        withLoading: withLoading,
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Expanded(
        child: ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Text(games[index].name ?? ""),
            );
          },
        ),
      ),
    );
  }
}