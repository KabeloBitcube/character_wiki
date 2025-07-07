import 'package:character_wiki/Character_Wiki/Domain/Location/Entities/location.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocations ();
}