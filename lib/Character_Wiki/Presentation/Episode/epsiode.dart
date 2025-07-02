import 'package:character_wiki/Character_Wiki/Presentation/Episode/Widgets/body.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes')),
      bottomNavigationBar: BottomNavBuilder(),
      body: BodyBuilder()
    );
  }
}
