import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_details/view/pages/character_details_provider.dart';
import "package:string_extensions/string_extensions.dart";
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/data/models/character_item.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_cubit.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/cubit/character_state.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    CharacterCubit characterCubit = context.read<CharacterCubit>();
    return Scaffold(
      body: BlocBuilder<CharacterCubit, CharacterState>(
        bloc: characterCubit,
        builder: (context, state) {
          List<CharacterItem>? listCharacters = state.characteres;
          return Stack(
            children: [
              ListView.builder(
                controller: _scrollController
                  ..addListener(() {
                    if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent) {
                      characterCubit.fetchData(
                          page: characterCubit.incrementPage());
                    }
                  }),
                itemCount: listCharacters?.length ?? 0,
                itemBuilder: ((context, index) {
                  CharacterItem? character = listCharacters?[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterDetailsProvider(
                                  characterId: character!.id!)));
                    },
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: Image.network(
                              character?.image ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            width: 220,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  character?.name ?? '',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _getColor(character!.status!)),
                                    ),
                                    Text(
                                        ' ${(character.status!.toString().split('.').last).capitalize} - ${character.species}'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                 Text(
                                  'Last Known location:',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  character.location!.name!,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                 Text(
                                  'First seen in:',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(character.nameFirstEpisodeAppeared),
                                const SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              if (state.isLoading)
                const Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
            ],
          );
        },
      ),
    );
  }

  Color _getColor(Status status) {
    switch (status) {
      case Status.dead:
        return Colors.red;

      case Status.alive:
        return Colors.green;

      case Status.unknown:
        return Colors.white;
    }
  }
}
