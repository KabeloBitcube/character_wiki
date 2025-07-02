import 'package:character_wiki/Character_Wiki/Data/Character/DataSource/character_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Data/Episode/DataSource/episode_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Data/Location/DataSource/location_remote_data_souce.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/get_characters.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/episode_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/epsiode_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/get_episodes.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/get_locations.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Character/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Episode/episode_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Location/location_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init () {
  //External
  sl.registerLazySingleton(() => http.Client());

  //Data sources 
  sl.registerLazySingleton(() => CharacterRemoteDataSource(client: sl()));
  sl.registerLazySingleton(() => EpisodeRemoteDataSource(client: sl()));
  sl.registerLazySingleton(() => LocationRemoteDataSouce(client: sl()));

  //Repositories 
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<EpsiodeRepository>(() => EpisodeRepositoryImpl(episodeRemoteDataSource: sl()));
  sl.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl(locationRemoteDataSouce: sl()));

  //Use cases
  sl.registerLazySingleton(() => GetCharacters(repository: sl()));
  sl.registerLazySingleton(() => GetEpisodes(sl()));
  sl.registerLazySingleton(() => GetLocations(locationRepository: sl()));

  //Blocs
  sl.registerFactory(() => CharacterBloc(sl()));
  sl.registerFactory(() => EpisodeBloc(sl()));
  sl.registerFactory(() => LocationBloc(sl()));
}