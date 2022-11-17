import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOF Pulls'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed('/settings'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
