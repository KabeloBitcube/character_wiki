// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Domain/Location/Entities/location.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/Repositories/location_repository.dart';

class GetLocations {
  LocationRepository locationRepository;

  GetLocations({
    required this.locationRepository,
  });

  Future<List<Location>> call () {
    return locationRepository.getLocations();
  }
}
