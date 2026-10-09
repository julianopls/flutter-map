import 'package:flutter/material.dart';
import 'mapa.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.map,
              size: 90,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Mapa',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Visualize o mapa e selecione um ponto.',
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapaPage(),
                  ),
                );
              },
              icon: const Icon(Icons.map_outlined),
              label: const Text('Abrir mapa'),
            ),
          ],
        ),
      ),
    );
  }
}