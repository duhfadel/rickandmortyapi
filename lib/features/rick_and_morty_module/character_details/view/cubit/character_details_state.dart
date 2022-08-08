import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';

class CharacterDetailsState {
  bool isLoaded = false;
  CharacterItem? characterItem;

  CharacterDetailsState({
    required this.isLoaded,
     this.characterItem,
  });
}
