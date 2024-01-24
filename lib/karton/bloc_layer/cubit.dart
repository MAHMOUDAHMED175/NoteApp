//retorfit
// class AppCubit extends Cubit<MyState> {
//   final CharactersRepoSitory myRepo;
//   AppCubit(this.myRepo) : super(initalState());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//   void emitGetAllChacters() {
//     myRepo.getAllCharacters().then((characterList) {
//       emit(getAllChactersState(characterList));
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/karton/bloc_layer/state.dart';

import '../data_layer/repository.dart';

class CharactersCubit extends Cubit<MyState> {
  CharactersCubit(this._charactersRepository) : super(initalState());
  static CharactersCubit get(context) => BlocProvider.of(context);

  final CharactersRepoSitory _charactersRepository;
  List<dynamic>? charactersList;
  // List<dynamic>? allCharactersList;
  List<dynamic>? serchedCharactersList = [];
  Future getAllCharacters() async {
    emit(LoadedGetAllCharactersState());

    // chararctersModel = await ChararctersModel.fromJson(_charactersRepository.getAllCharacters());
    // allCharactersList = charactersList;
    // print(
    //     '==========allCharactersList ${chararctersModel}====================');
    return _charactersRepository.getAllCharacters();
  }
}
