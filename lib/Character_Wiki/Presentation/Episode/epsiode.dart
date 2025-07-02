import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Character/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Episode/episode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes')),
      bottomNavigationBar: bottomNavBuilder(context),
      body: BlocBuilder<EpisodeBloc, EpisodeState>(
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
                    Text(
                      'Number of characters:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(' ${episode.characters.length}'),
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
      ),
    );
  }

  Padding bottomNavBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: () {
              context.read<CharacterBloc>().add(const FetchCharacters());
              context.go('/');
            },
            child: Text('Characters'),
          ),
          MaterialButton(
            onPressed: () {
              context.read<EpisodeBloc>().add(FetchEpisodes());
              context.go('/episodes');
            },
            child: Text('Episodes'),
          ),
          MaterialButton(onPressed: () {}, child: Text('Locations')),
        ],
      ),
    );
  }
}
