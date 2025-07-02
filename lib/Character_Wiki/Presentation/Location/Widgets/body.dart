import 'package:character_wiki/Character_Wiki/Presentation/Bloc/Location/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const CircularProgressIndicator()],
            ),
          );
        } else if (state is LocationLoaded) {
          final locations = state.locations;
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];

              return ExpansionTile(
                title: Text(location.name),
                subtitle: Text(
                  '${location.type} - Dimension: ${location.dimension}',
                ),
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Number of residents:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(' ${location.residents.length}'),
                ],
              );
            },
          );
        } else if (state is LocationError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
