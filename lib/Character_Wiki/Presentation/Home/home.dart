// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Character/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/body.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/bottom_nav.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/drawer.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/offline.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(const FetchCharacters());
    checkConnection();
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      final hasConnection = result.any(
        (connection) => connection != ConnectivityResult.none,
      );
      setState(() {
        isOffline = !hasConnection;
      });
    });
  }

  Future<void> checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      isOffline = result == ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Rick & Morty Wiki')),
      drawer: isOffline ? null : DrawerBuilder(),
      bottomNavigationBar: isOffline ? null : BottomNavBuilder(),
      body: isOffline ? Offline() : BodyBuilder(),
    );
  }
}
