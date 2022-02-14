import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/providers/characters_provider.dart';
import 'package:rickandmorty/providers/episodes_provider.dart';
import 'package:rickandmorty/providers/locations_provider.dart';
import 'package:rickandmorty/widgets/principal.dart';
import 'package:rickandmorty/widgets/target_error.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final charactersProvider = Provider.of<CharacterProvider>(context);
    final episodesProvider = Provider.of<EpisodesProvider>(context);
    final locationsProvider = Provider.of<LocationsProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty'),
          centerTitle: true,
          elevation: 0,
        ),
        body: charactersProvider.characters.isEmpty
            ? TargetError()
            : ColumnScroll(
                location: locationsProvider.locationPpal,
                episodes: episodesProvider.infoCapitulos,
                personajes: charactersProvider.characters,
                onNextPage: () => charactersProvider.getAllCharacters(),
              ));
  }
}
