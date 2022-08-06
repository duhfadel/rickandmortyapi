import 'package:dio/dio.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class RickAndMortyApiImp implements RickAndMortyApi {
  final Dio dio;

  RickAndMortyApiImp({
    required this.dio,
  });

  @override
  Future getCharacterById(int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
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
}
