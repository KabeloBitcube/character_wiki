import 'package:flutter/material.dart';

class Offline extends StatelessWidget {
  const Offline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/r&m.jpg',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(height: 20,),
          const Text('You\'re offline!'),
          const SizedBox(height: 20,),
          const Text('Check your internet connection.')
        ],
      ),
    );
  }
}
