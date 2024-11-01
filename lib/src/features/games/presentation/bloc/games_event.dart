part of 'games_bloc.dart';

abstract class GamesEvent {
  const GamesEvent();
}

class OnGettingGamesEvent extends GamesEvent {
  final String name;
  final bool withLoading;

  OnGettingGamesEvent(this.name, {this.withLoading = true});
}