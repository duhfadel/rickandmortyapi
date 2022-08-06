import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';

class CharacterState {
  bool isLoaded = false;
  List<CharacterItem>? characteres;
  int currentPage;

  CharacterState(
      {required this.isLoaded, this.characteres, this.currentPage = 1});
}
