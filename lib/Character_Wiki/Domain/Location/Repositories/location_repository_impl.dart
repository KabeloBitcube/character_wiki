// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_wiki/Character_Wiki/Data/Location/DataSource/location_remote_data_souce.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/Entity/location.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/Repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationRemoteDataSouce locationRemoteDataSouce;

  LocationRepositoryImpl({
    required this.locationRemoteDataSouce,
  });

  @override
  Future<List<Location>> getLocations() async {
    final models = await  locationRemoteDataSouce.getLocations();
    return models.map((model) => 
    Location(
      id: model.id,
      name: model.name, 
      type: model.type, 
      dimension: model.dimension, 
      residents: model.residents
      )
    ).toList();
  }

}
