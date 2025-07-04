import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Episode/episode_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Episode/Widgets/characters_from_epsiode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        if (state is EpisodeLoading) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const CircularProgressIndicator()],
            ),
          );
        } else if (state is EpisodeLoaded) {
          final episodes = state.episodes;
          return ListView.builder(
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              final episode = episodes[index];

              return ExpansionTile(
                title: Text(episode.name),
                subtitle: Text(
                  '${episode.episode} - Aired on: ${episode.airDate}',
                ),
                children: [
                  SizedBox(height: 15),
                  CharactersFromEpisode(characterUrls: episode.characters)
                ],
              );
            },
          );
        } else if (state is EpisodeError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
