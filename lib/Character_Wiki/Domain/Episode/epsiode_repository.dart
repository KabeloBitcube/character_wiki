import 'package:character_wiki/Character_Wiki/Domain/Episode/epsiode.dart';

abstract class EpsiodeRepository {
  Future<List<Episode>> getEpisodes ();
}