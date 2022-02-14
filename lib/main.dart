import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/pages/pages.dart';
import 'package:rickandmorty/providers/characters_provider.dart';
import 'package:rickandmorty/providers/episodes_provider.dart';
import 'package:rickandmorty/providers/locations_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => EpisodesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => LocationsProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme:
              const AppBarTheme(color: Color.fromRGBO(80, 180, 40, 1))),
    );
  }
}
