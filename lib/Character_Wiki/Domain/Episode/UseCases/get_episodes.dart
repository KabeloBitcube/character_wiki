// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Domain/Episode/Entity/epsiode.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/Repositories/epsiode_repository.dart';

class GetEpisodes {
  final EpsiodeRepository episodeRepository;

  GetEpisodes(this.episodeRepository);

  Future<List<Episode>> call () {
    return episodeRepository.getEpisodes();
  }
}
