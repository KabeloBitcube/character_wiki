import 'package:character_wiki/Character_Wiki/Domain/Character/Entity/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters ();
}