// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterItem _$CharacterItemFromJson(Map<String, dynamic> json) =>
    CharacterItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      origin: json['origin'] == null
          ? null
          : Location.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      episode:
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$CharacterItemToJson(CharacterItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusEnumMap[instance.status],
      'species': instance.species,
      'type': instance.type,
      'gender': _$GenderEnumMap[instance.gender],
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };

const _$StatusEnumMap = {
  Status.alive: 'Alive',
  Status.dead: 'Dead',
  Status.unknown: 'unknown',
};

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
  Gender.unknown: 'unknown',
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
