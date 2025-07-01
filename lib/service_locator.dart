import 'package:character_wiki/Character_Wiki/Data/character_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/character_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Domain/get_characters.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init () {
  //External
  sl.registerLazySingleton(() => http.Client());

  //Data sources 
  sl.registerLazySingleton(() => CharacterRemoteDataSource(client: sl()));

  //Repositories 
  sl.registerLazySingleton(() => CharacterRepositoryImpl(remoteDataSource: sl()));

  //Use cases
  sl.registerLazySingleton(() => GetCharacters(repository: sl()));

  //Blocs
  sl.registerFactory(() => sl());
}