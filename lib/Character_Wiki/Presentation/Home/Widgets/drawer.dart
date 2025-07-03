import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Character/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DrawerBuilder extends StatefulWidget {
  const DrawerBuilder({super.key});

  @override
  State<DrawerBuilder> createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  String? selectedStatus;
  String? selectedSpecies;
  String? selectedGender;

  List<String> statusOptions = ['Alive', 'Dead', 'Unknown'];
  List<String> speciesOptions = ['Human', 'Alien'];
  List<String> genderOptions = ['Male', 'Female'];

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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [const Text('Select all options')],
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
                          SizedBox(
                            width: 150,
                            child: DropdownButtonFormField(
                              value: selectedStatus,
                              hint: Text('Status'),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedStatus = newValue;
                                });
                              },
                              items: statusOptions
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: DropdownButtonFormField(
                              value: selectedSpecies,
                              hint: Text('Species'),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedSpecies = newValue;
                                });
                              },
                              items: speciesOptions
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: DropdownButtonFormField(
                              value: selectedGender,
                              hint: Text('Gender'),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              },
                              items: genderOptions
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                            ),
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
                    if (selectedStatus == null || selectedSpecies == null || selectedGender == null){
                      return;
                    }
                    context.read<CharacterBloc>().add(
                      FilterCharacters(
                        status: selectedStatus,
                        species: selectedSpecies,
                        gender: selectedGender,
                      ),
                    );
                    context.pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Filter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
