import 'package:character_wiki/Character_Wiki/Presentation/Home/Widgets/bottom_nav.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Location/Widgets/body.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations')),
      bottomNavigationBar: BottomNavBuilder(),
      body: BodyBuilder()
    );
  }
}
