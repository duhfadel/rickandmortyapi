import 'package:json_annotation/json_annotation.dart';

part 'character_item.g.dart';

@JsonSerializable()
class CharacterItem {
  CharacterItem({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  int? id;
  String? name;
  Status? status;
  String? species;
  String? type;
  Gender? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;
  String nameFirstEpisodeAppeared = '';

  factory CharacterItem.fromJson(Map<String, dynamic> json) =>
      _$CharacterItemFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterItemToJson(this);
}

enum Status {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  @JsonValue('unknown')
  unknown
}

enum Gender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  @JsonValue('unknown')
  unknown,

}

@JsonSerializable()
class Location {
  Location({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
