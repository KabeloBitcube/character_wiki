import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Character/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/body.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/bottom_nav.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(const FetchCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Rick & Morty Wiki')),
      drawer: DrawerBuilder(),
      bottomNavigationBar: BottomNavBuilder(),
      body: BodyBuilder(),
    );
  } 
}
  