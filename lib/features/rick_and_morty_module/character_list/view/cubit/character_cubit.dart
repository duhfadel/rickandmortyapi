import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_state.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class CharacterCubit extends Cubit<CharacterState> {
  RickAndMortyApi rickAndMortyApi;

  CharacterCubit({
    required this.rickAndMortyApi,
  }) : super(CharacterState(isLoaded: false)) {
    fetchData();
  }

  void fetchData({int? page}) async {
    try {
      CharacterBaseResponse characterBaseResponse =
          await rickAndMortyApi.getCharacters(page: page);
      emit(CharacterState(
        isLoaded: true,
        characteres: characterBaseResponse.results,
        currentPage: page ?? 1,
      ));
    } catch (e) {
      print(e);
    }
  }
}
