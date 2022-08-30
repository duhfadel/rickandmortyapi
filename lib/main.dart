import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/pages/character_list_provider.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api_imp.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/theme/theme.dart';
import 'package:rickandmortyapp/http_client/dio_http_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Changed RepositoryProvider from Bloc, so there is no need to use Provider
    return RepositoryProvider<DioHttpClient>(
      create: (context) => DioHttpClient(),
      child: RepositoryProvider<RickAndMortyApi>(
        create: (context) =>
            RickAndMortyApiImp(dio: context.read<DioHttpClient>().dio),
        child: MaterialApp(
          theme: CustomTheme.darkTheme,
          home: const CharacterListProvider(),
        ),
      ),
    );
  }
}
