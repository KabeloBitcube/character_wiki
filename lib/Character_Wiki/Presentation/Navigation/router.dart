import 'package:character_wiki/Character_Wiki/Presentation/Episode/epsiode.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Home();
      },
    ),
    GoRoute(
      path: '/episodes',
      builder: (context, state) {
        return EpisodeScreen();
      },
    ),
  ],
);

