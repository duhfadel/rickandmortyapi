// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterBaseResponse _$CharacterBaseResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterBaseResponse(
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CharacterItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterBaseResponseToJson(
        CharacterBaseResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
