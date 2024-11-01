import 'package:flutter/material.dart';
import 'package:switch_db/src/features/games/domain/models/game_model.dart';
import 'package:switch_db/src/features/games/domain/usecases/games_usecase.dart';
import 'package:switch_db/src/features/games/presentation/bloc/games_bloc.dart';
import 'package:switch_db/src/shared/presentation/reload_widget.dart';
import '../../../../core/utils/injections/injections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/LoadingPage.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final GamesBloc _bloc = GamesBloc(gamesUseCase: getIt<GamesUseCase>());
  List<GameModel> games = [];
  String selectedName = "";

  @override
  void initState() {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<GamesBloc, GamesState>(
          bloc: _bloc,
          listener: (context, state) {
            if(state is SuccessGetGamesState){
              addGames(state.games);
            }
          },
          builder: (context, state) {
            if (state is LoadingGetGamesState) {
              return const LoadingPage();
            } else if (state is ErrorGetGamesState) {
              return buildReloadWidget(state);
            } else if(games.isEmpty) {
              return buildEmptyWidget();
            } else {
              return buildGamesList(theme);
            }
          },
        ),
      ),
    );
  }

  void addGames(List<GameModel> gamesFromState) {
    games.clear();
    games = List.from(gamesFromState);
  }

  ListView buildGamesList(ThemeData theme) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text(games[index].name ?? "",
              style: theme.textTheme.displaySmall!.copyWith()),
        );
      },
    );
  }

  ReloadWidget buildReloadWidget(ErrorGetGamesState state) {
    return ReloadWidget.error(
        content: state.errorMsg, onPressed: () => callGames);
  }

  Widget buildEmptyWidget() {
    return const ReloadWidget.empty(content: "Empty!");
  }
}
