import 'package:json_annotation/json_annotation.dart';

part 'release_dates_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReleaseDatesModel {
  @JsonKey(name: 'Japan')
  String? japan;

  @JsonKey(name: 'NorthAmerica')
  String? northAmerica;

  @JsonKey(name: 'Europe')
  String? europe;

  @JsonKey(name: 'Australia')
  String? australia;

  ReleaseDatesModel({
    this.japan,
    this.northAmerica,
    this.europe,
    this.australia,
  });

  factory ReleaseDatesModel.fromJson(json) => _$ReleaseDatesModelFromJson(json);

  toJson() => _$ReleaseDatesModelToJson(this);
}
