import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Character/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [const Text('Characters')],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        DropdownMenu(
                          label: Text('Status'),
                          dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(value: 'Alive', label: 'Alive'),
                            DropdownMenuEntry(value: 'Dead', label: 'Dead'),
                            DropdownMenuEntry(
                              value: 'Unknown',
                              label: 'Unknown',
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        DropdownMenu(
                          label: Text('Species'),
                          dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(value: 'Human', label: 'Human'),
                            DropdownMenuEntry(value: 'Alien', label: 'Alien'),
                            DropdownMenuEntry(value: 'Robot', label: 'Robot'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        DropdownMenu(
                          label: Text('Gender'),
                          dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(value: 'Female', label: 'Female'),
                            DropdownMenuEntry(value: 'Male', label: 'Male'),
                            DropdownMenuEntry(
                              value: 'Unknown',
                              label: 'Unknown',
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<CharacterBloc>().add(const FetchCharacters());
                  context.pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Filter', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Clear Filters',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }
}