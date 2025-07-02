part of 'episode_bloc.dart';

sealed class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}


class FetchEpisodes extends EpisodeEvent {}