import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInitialLocation = ref.watch(userLocationProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Controlled Map"),
      // ),
      body: userInitialLocation.when(
        data: (latlng) {
          final (lat, lng) = latlng;

          return MapAndControls(
            lat: lat,
            lng: lng,
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('Error ${error.toString()}'),
        ),
        loading: () => const Center(
          child: Text('Locating...'),
        ),
      ),
    );
  }
}

class MapAndControls extends ConsumerWidget {
  const MapAndControls({
    super.key,
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapControllerState = ref.watch(mapProvider);
    return Stack(
      children: [
        _MapView(initialLat: lat, initialLng: lng),
        Positioned(
          top: 40,
          left: 20,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: FloatingActionButton(
            heroTag: 'location',
            onPressed: () {
              ref.read(mapProvider.notifier).findUser();
            },
            child: const Icon(Icons.location_searching),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 20,
          child: FloatingActionButton(
            heroTag: 'directions',
            onPressed: () {
              ref.read(mapProvider.notifier).toggleFollowUser();
            },
            child: mapControllerState.followUser
                ? const Icon(Icons.accessibility_new)
                : const Icon(Icons.directions_run),
          ),
        ),
        Positioned(
          bottom: 180,
          left: 20,
          child: FloatingActionButton(
            heroTag: 'pin',
            onPressed: () {
              ref
                  .read(mapProvider.notifier)
                  .addMarkerCurrentLocation('I was here!');
            },
            child: const Icon(Icons.pin_drop),
          ),
        ),
      ],
    );
  }
}

class _MapView extends ConsumerStatefulWidget {
  const _MapView({
    required this.initialLat,
    required this.initialLng,
  });

  final double initialLat;
  final double initialLng;

  @override
  ConsumerState<_MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {
    final mapControlledState = ref.watch(mapProvider);
    return GoogleMap(
      markers: mapControlledState.markersSet,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLat, widget.initialLng),
        zoom: 15,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      compassEnabled: true,
      onMapCreated: (controller) {
        ref.read(mapProvider.notifier).setMapController(controller);
      },
      onLongPress: (latLng) {
        ref
            .read(mapProvider.notifier)
            .addMarker(latLng.latitude, latLng.longitude, 'Custom marker');
      },
    );
  }
}
