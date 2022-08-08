import 'package:dio/dio.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/episode.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class RickAndMortyApiImp implements RickAndMortyApi {
  final Dio dio;

  RickAndMortyApiImp({
    required this.dio,
  });

  @override
  Future<CharacterItem> getCharacterById(int id) async {
    Response response = await dio.get('character/$id');
    if (response.statusCode == 200) {
      return CharacterItem.fromJson(response.data);
    }
    throw response.data;
  }

  @override
  Future<CharacterBaseResponse> getCharacters({int? page}) async {
    Map<String, int>? queryParameters;
    if (page != null) {
      queryParameters = {'page': page};
    }
    Response response =
        await dio.get('character', queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return CharacterBaseResponse.fromJson(response.data);
    }
    throw response.data;
  }

  @override
  Future<Episode> getFirstEpisode(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return Episode.fromJson(response.data);
    }
    throw response.data;
  }
}
