import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';

abstract class RickAndMortyApi {
  Future<CharacterBaseResponse> getCharacters({int? page});
  Future getCharacterById(int id);
}
