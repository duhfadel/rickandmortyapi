import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_details/view/cubit/character_details_state.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  RickAndMortyApi rickAndMortyApi;
 
  final int characterId;

  CharacterDetailsCubit(
      {required this.rickAndMortyApi,
      required this.characterId})
      : super(CharacterDetailsState(isLoaded: false)){
    fetchDataById(characterId);
  }

  void fetchDataById(int id) async {
    try {
      CharacterItem characterItem = await rickAndMortyApi.getCharacterById(characterId);
      emit(CharacterDetailsState(isLoaded: true, characterItem: characterItem));
    } catch (e) {
      print(e);
    }
  }
}
