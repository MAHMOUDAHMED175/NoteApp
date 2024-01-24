import 'package:todo/karton/data_layer/webservies.dart';

class CharactersRepoSitory {
  final CharactersWebservices charactersWebServices;
  CharactersRepoSitory(this.charactersWebServices);

  // method might put name fetechData or retriveData or getData ...
  Future getAllCharacters() async {
    var response = await charactersWebServices.getAllCharacters();
    return response;
    // .map((characters) =>
    //     Results.fromJson(characters)
    // .toList();
  }
}
