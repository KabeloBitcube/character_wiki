// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Domain/Episode/epsiode.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/epsiode_repository.dart';

class GetEpisodes {
  final EpsiodeRepository episodeRepository;

  GetEpisodes(this.episodeRepository);

  Future<List<Episode>> call () {
    return episodeRepository.getEpisodes();
  }
}
