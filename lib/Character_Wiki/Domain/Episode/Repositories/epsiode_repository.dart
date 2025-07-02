import 'package:character_wiki/Character_Wiki/Domain/Episode/Entity/epsiode.dart';

abstract class EpsiodeRepository {
  Future<List<Episode>> getEpisodes ();
}