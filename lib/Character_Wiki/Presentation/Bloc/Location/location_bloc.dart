// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:character_wiki/Character_Wiki/Domain/Location/get_locations.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  GetLocations getLocations;

  LocationBloc(
    this.getLocations,
  ) : super(LocationInitial()) {
    on<FetchLocations>((event, emit) async {
      emit(LocationLoading());
      try {
        final locations = await getLocations();
        emit(LocationLoaded(locations: locations));
      } catch (e) {
        emit(LocationError(message: e.toString()));
      }
    });
  }
}
