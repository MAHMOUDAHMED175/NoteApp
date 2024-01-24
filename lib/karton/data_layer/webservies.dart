//retrofit
// part 'webservies.g.dart';
//
// @RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
// abstract class CharactersWebServices {
//   factory CharactersWebServices(Dio dio, {String baseUrl}) =
//       _CharactersWebServices;
//
//   @GET('character')
//   Future<List<Results>> getAllCharacters();
// }

import 'package:dio/dio.dart';
import 'package:todo/karton/constansts/strings.dart';

import 'model/ChararctersModel.dart';

class CharactersWebservices {
  Dio dio = Dio();
  CharactersWebservices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseurl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        receiveDataWhenStatusError: true);

    dio = Dio(options);
  }
  static ChararctersModel? chararctersModel;

  Future getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      ////////////////////////////////////////////////
      chararctersModel = ChararctersModel.fromJson(response.data);
      print('Error  ${chararctersModel?.results![2].gender}');
      return response.data;
    } catch (error) {
      print('Error is $error');
      return [];
    }
  }
}
