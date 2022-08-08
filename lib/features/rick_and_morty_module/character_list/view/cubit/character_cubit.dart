import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_state.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class CharacterCubit extends Cubit<CharacterState> {
  RickAndMortyApi rickAndMortyApi;

  List<CharacterItem> _allChar = [];
  int page = 1;

  CharacterCubit({
    required this.rickAndMortyApi,
  }) : super(CharacterState(isLoading: true)) {
    fetchData();
  }

  void fetchData({int? page}) async {
    emit(CharacterState(
        isLoading: true,
        characteres: _allChar,
      ));
    try {
      CharacterBaseResponse characterBaseResponse =
          await rickAndMortyApi.getCharacters(page: page);
      _allChar += characterBaseResponse.results!;
      //fetchFirstEpisode goes async
      _fetchFirstEpisode(characterBaseResponse.results!
          .map((e) => {e.id!: e.episode!.first})
          .toList());
    } catch (e) {
      print(e);
    }
    finally{
      emit(CharacterState(
        isLoading: false,
        characteres: _allChar,
      ));
    }
  }

  void _fetchFirstEpisode(List<Map<int, String>> urls) async {
    urls.forEach((urlsMap) {
      rickAndMortyApi.getFirstEpisode(urlsMap.values.first).then((value) {
        _allChar
            .firstWhere((element) => element.id == urlsMap.keys.first)
            .nameFirstEpisodeAppeared = value.name ?? '';
        emit(CharacterState(
          isLoading: false,
          characteres: _allChar,
        ));
      });
    });
  }

  int incrementPage() {
    page++;
    return page;
  }
}
