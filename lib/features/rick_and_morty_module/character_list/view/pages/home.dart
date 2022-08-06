import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_cubit.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterCubit characterCubit = context.read<CharacterCubit>();
    return Scaffold(
      body: BlocBuilder<CharacterCubit, CharacterState>(
        bloc: characterCubit,
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.characteres?.length ?? 0,
            itemBuilder: ((context, index) {
              return Text(
                state.characteres?.elementAt(index).name ?? '',
                style: TextStyle(fontSize: 40),
              );
            }),
          );
        },
      ),
    );
  }
}
