part of 'episode_bloc.dart';

sealed class EpisodeState extends Equatable {
  const EpisodeState();
  
  @override
  List<Object> get props => [];
}

final class EpisodeInitial extends EpisodeState {}

final class EpisodeLoading extends EpisodeState {}

final class EpisodeLoaded extends EpisodeState {
  final List<Episode> episodes;

  const EpisodeLoaded(this.episodes);

  @override
  List<Object> get props => [episodes];
}

final class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError(this.message);

  @override
  List<Object> get props => [message];
}
