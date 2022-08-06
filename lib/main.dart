import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/character_list/view/pages/character_list_provider.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api.dart';
import 'package:rickandmortyapp/features/rick_and_morty_module/data/remote_api/rick_and_morty_api_imp.dart';
import 'package:rickandmortyapp/http_client/dio_http_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DioHttpClient>(
      create: (context) => DioHttpClient(),
      child: Provider<RickAndMortyApi>(
        create: (context) =>
            RickAndMortyApiImp(dio: context.read<DioHttpClient>().dio),
        child:  MaterialApp(
          theme: ThemeData.dark(),
          home: const CharacterListProvider(),
        ),
      ),
    );
  }
}
