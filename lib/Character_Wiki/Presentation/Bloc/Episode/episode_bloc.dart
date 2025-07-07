// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:character_wiki/Character_Wiki/Domain/Episode/Entities/epsiode.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/UseCases/get_episodes.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodes getEpisodes;
  
  EpisodeBloc(
    this.getEpisodes,
  ) : super(EpisodeInitial()) {
    on<FetchEpisodes>((event, emit) async {
      emit(EpisodeLoading());
      try {
        final episodes = await getEpisodes();
        emit(EpisodeLoaded(episodes));
      }
      catch (e) {
        emit(EpisodeError(e.toString()));
      }
    });
  }
}
