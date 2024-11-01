import 'package:json_annotation/json_annotation.dart';
import 'release_dates_model.dart';

part 'game_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GameModel {
  int? id;
  String? name;
  List<String>? genre;
  List<String>? developers;
  List<String>? publishers;
  ReleaseDatesModel? releaseDates;

  GameModel(
      {this.id,
      this.name,
      this.genre,
      this.developers,
      this.publishers,
      this.releaseDates});

  factory GameModel.fromJson(json) => _$GameModelFromJson(json);

  toJson() => _$GameModelToJson(this);

  static List<GameModel> fromJsonList(List? json) {
    return json?.map((e) => GameModel.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (notRuntimeType(other)) return false;
    if (other is GameModel) return other.id == id;
    return false;
  }

  bool notRuntimeType(Object other) => other.runtimeType != runtimeType;
}
