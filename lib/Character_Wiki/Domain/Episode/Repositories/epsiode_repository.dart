import 'package:character_wiki/Character_Wiki/Domain/Episode/Entities/epsiode.dart';

abstract class EpsiodeRepository {
  Future<List<Episode>> getEpisodes ();
}