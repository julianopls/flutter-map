import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  LatLng? pontoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-22.9056, -47.0608),
          initialZoom: 13,
          onTap: (tapPosition, ponto) {
            setState(() {
              pontoSelecionado = ponto;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Latitude: ${ponto.latitude.toStringAsFixed(6)}\n'
                  'Longitude: ${ponto.longitude.toStringAsFixed(6)}',
                ),
              ),
            );
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.map_flutter',
          ),
          if (pontoSelecionado != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: pontoSelecionado!,
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 45,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}