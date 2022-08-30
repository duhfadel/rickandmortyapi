import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_details/view/cubit/character_details_cubit.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_details/view/cubit/character_details_state.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:string_extensions/string_extensions.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterDetailsCubit characterDetailsCubit =
        context.read<CharacterDetailsCubit>();
    return Scaffold(
      body: BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
          bloc: characterDetailsCubit,
          builder: (context, state) {
            if (!state.isLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      state.characterItem?.image ?? '',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Center(
                    child: Text(state.characterItem!.name!,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  Row(
                    children: [
                      const Text('Species: '),
                      Text(
                        state.characterItem!.species!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(getIcon(state.characterItem!.gender!)),
                      const Text(' Gender: '),
                      Text(
                        ' ${(state.characterItem!.gender!.toString().split('.').last).capitalize}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const Text(' Location: '),
                      Text(
                        state.characterItem!.location!.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: (state.characterItem!.type! != ''),
                    child: Row(
                      children: [
                        const Icon(Icons.add_box_outlined),
                        const Text(' Type: '),
                        Text(
                          state.characterItem!.type!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  IconData getIcon(Gender gender) {
    switch (gender) {
      case Gender.male:
        return Icons.male;

      case Gender.female:
        return Icons.female;

      case Gender.unknown:
        return Icons.tag_faces;
    }
  }
}
