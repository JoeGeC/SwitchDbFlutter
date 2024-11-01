part of 'games_bloc.dart';

abstract class GamesState {
  const GamesState();
}

class SwitchGamesInitial extends GamesState {}

class LoadingGetGamesState extends GamesState {}

class ErrorGetGamesState extends GamesState {
  final String errorMsg;

  ErrorGetGamesState(this.errorMsg);
}

class SuccessGetGamesState extends GamesState {
  final List<GameModel> games;

  SuccessGetGamesState(this.games);
}