import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/characters_base_response.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_cubit.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/pages/home.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';

class CharacterListProvider extends StatelessWidget {
  const CharacterListProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterCubit>(
      create: (context) {
        return CharacterCubit(rickAndMortyApi: context.read<RickAndMortyApi>());
      },
      child: const HomeView(),
    );
  }
}
