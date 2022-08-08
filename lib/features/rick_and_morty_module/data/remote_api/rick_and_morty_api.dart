import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/episode.dart';

abstract class RickAndMortyApi {
  Future<CharacterBaseResponse> getCharacters({int? page});
  Future<CharacterItem> getCharacterById(int id);
  Future<Episode> getFirstEpisode(String url);
}
