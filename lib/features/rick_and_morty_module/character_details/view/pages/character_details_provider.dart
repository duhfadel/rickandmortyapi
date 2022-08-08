import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_details/view/cubit/character_details_cubit.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_details/view/pages/character_details.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class CharacterDetailsProvider extends StatelessWidget {
  const CharacterDetailsProvider({
    Key? key,
    required this.characterId,
  }) : super(key: key);
  final int characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterDetailsCubit>(
      create: (context) {
        return CharacterDetailsCubit(
            rickAndMortyApi: context.read<RickAndMortyApi>(),
            characterId: characterId);
      },
      child: const CharacterDetailsView(),
    );
  }
}
