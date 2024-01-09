import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocationAsync = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: currentLocationAsync.when(
        data: (data) {
          final (lat, lng) = data;
          return _MapView(
            initialLat: lat,
            initialLng: lng,
          );
        },
        error: (error, stackTrace) => Center(
          child: Text("Error: $error"),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _MapView extends StatefulWidget {
  const _MapView({required this.initialLat, required this.initialLng});

  final double initialLat;
  final double initialLng;

  @override
  State<_MapView> createState() => __MapViewState();
}

class __MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLat, widget.initialLng),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
        },
      ),
    );
  }
}
