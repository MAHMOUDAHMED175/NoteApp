import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../bloc_layer/cubit.dart';
import '../data_layer/repository.dart';

GetIt getIt = GetIt.instance;
//Dio dio=Dio();

void initializeGetIt() {
  getIt.registerLazySingleton<CharactersCubit>(() => CharactersCubit(getIt()));
  getIt.registerLazySingleton<CharactersRepoSitory>(
      () => CharactersRepoSitory(getIt()));
  //getIt.registerLazySingleton<CharactersWebservices>(
  //   ()=>);
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio.options.connectTimeout = Duration(seconds: 20);
  dio.options.receiveTimeout = Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    responseHeader: true,
    responseBody: true,
    error: true,
    request: true,
    requestHeader: true,
    requestBody: true,
  ));

  return dio;
}
