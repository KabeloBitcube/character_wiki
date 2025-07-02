// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Data/Episode/DataSource/episode_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/epsiode.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/epsiode_repository.dart';

class EpisodeRepositoryImpl implements EpsiodeRepository {
  EpisodeRemoteDataSource episodeRemoteDataSource;
  
  EpisodeRepositoryImpl({
    required this.episodeRemoteDataSource,
  });

  @override
  Future<List<Episode>> getEpisodes() async {
    final models = await episodeRemoteDataSource.getEpisodes();

    return models.map((model) => 
    Episode(
      id: model.id, 
      name: model.name, 
      airDate: model.airDate, 
      episode: model.episode, 
      characters: model.characters
      )).toList();
  }
}
