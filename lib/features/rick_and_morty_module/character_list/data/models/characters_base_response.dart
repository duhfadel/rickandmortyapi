import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/info.dart';

part 'characters_base_response.g.dart';

@JsonSerializable()
class CharacterBaseResponse {
  CharacterBaseResponse({
    this.info,
    this.results,
  });

  Info? info;
  List<CharacterItem>? results;

  factory CharacterBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterBaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterBaseResponseToJson(this);
}

