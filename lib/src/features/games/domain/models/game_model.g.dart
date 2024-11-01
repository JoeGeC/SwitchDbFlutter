// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      developers: (json['developers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publishers: (json['publishers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      releaseDates: json['release_dates'] == null
          ? null
          : ReleaseDatesModel.fromJson(
              json['release_dates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'genre': instance.genre,
      'developers': instance.developers,
      'publishers': instance.publishers,
      'release_dates': instance.releaseDates,
    };
