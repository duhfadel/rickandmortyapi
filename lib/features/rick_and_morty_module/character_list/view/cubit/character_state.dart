import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';

class CharacterState {
  bool isLoading = false;
  List<CharacterItem>? characteres;

  CharacterState({
    required this.isLoading,
    this.characteres,
  });
}
