part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();
  
  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final List<Location> location;

  const LocationLoaded({required this.location});

  @override
  List<Object> get props => [location];
}

final class LocationError extends LocationState {
  final String message;

  const LocationError({required this.message});

  @override
  List<Object> get props => [message];
}
