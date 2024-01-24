import 'package:flutter/material.dart';
import 'package:todo/karton/presenation_layer/screens/characters.dart';

import 'bloc_layer/cubit.dart';
import 'constansts/strings.dart';
import 'data_layer/model/Results.dart';
import 'data_layer/repository.dart';
import 'data_layer/webservies.dart';
import 'presenation_layer/screens/character_details.dart';

class AppRouter {
  late CharactersRepoSitory charactersRepoSitory;
  late CharactersCubit chactersCubit;
  AppRouter() {
    charactersRepoSitory = CharactersRepoSitory(CharactersWebservices());
    chactersCubit = CharactersCubit(charactersRepoSitory);
  }
  Route<dynamic> appRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (context) => CharactersScreen());
      case charcter_details:
        final selectedCharcters = settings.arguments as Results;
        return MaterialPageRoute(
            builder: (context) =>
                CharactersDetailsScreen(character: selectedCharcters));
      default:
        return errorRoute();
    }
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Icon(
            Icons.no_adult_content,
            size: 20,
          ),
          Text('This Page is Not Found'),
        ],
      ),
    ),
  );
}
