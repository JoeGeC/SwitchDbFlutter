// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_dates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseDatesModel _$ReleaseDatesModelFromJson(Map<String, dynamic> json) =>
    ReleaseDatesModel(
      japan: json['Japan'] as String?,
      northAmerica: json['NorthAmerica'] as String?,
      europe: json['Europe'] as String?,
      australia: json['Australia'] as String?,
    );

Map<String, dynamic> _$ReleaseDatesModelToJson(ReleaseDatesModel instance) =>
    <String, dynamic>{
      'Japan': instance.japan,
      'NorthAmerica': instance.northAmerica,
      'Europe': instance.europe,
      'Australia': instance.australia,
    };
