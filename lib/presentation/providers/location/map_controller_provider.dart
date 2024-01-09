import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

@riverpod
class Map extends _$Map {
  @override
  MapState build() {
    trackUser().listen((event) {
      final (lat, lng) = event;
      lastKnownLocation = (lat, lng);
    });

    return MapState();
  }

  StreamSubscription? userLocationSubscription$;
  (double, double)? lastKnownLocation;

  Stream<(double, double)> trackUser() async* {
    await for (final pos in Geolocator.getPositionStream()) {
      yield (pos.latitude, pos.longitude);
    }
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(
      controller: controller,
      isReady: true,
    );
  }

  void goToLocation(double lat, double lng) {
    if (!state.isReady) return;

    // print('isReady: ${state.isReady}');

    final newCameraPosition = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 15,
    );

    state.controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        newCameraPosition,
      ),
    );
  }

  void toggleFollowUser() {
    state = state.copyWith(
      followUser: !state.followUser,
    );

    if (state.followUser) {
      userLocationSubscription$ = trackUser().listen(
        (event) {
          final (lat, lng) = event;
          goToLocation(lat, lng);
        },
      );
    } else {
      userLocationSubscription$?.cancel();
    }
  }

  void findUser() async {
    if (lastKnownLocation == null) return;

    final (lat, lng) = lastKnownLocation!;

    goToLocation(lat, lng);
  }

  void addMarker(double lat, double lng, String name) {
    final newMarker = Marker(
      markerId: MarkerId(state.markers.length.toString()),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: name, snippet: 'Esto es un marcador'),
    );

    state = state.copyWith(
      markers: [...state.markers, newMarker],
    );
  }

  void addMarkerCurrentLocation(String name) async {
    if (lastKnownLocation == null) return;

    final (lat, lng) = lastKnownLocation!;

    addMarker(lat, lng, name);
  }
}

// States

class MapState {
  MapState({
    this.isReady = false,
    this.followUser = false,
    this.markers = const [],
    this.controller,
  });

  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  Set<Marker> get markersSet => Set.from(markers);

  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) =>
      MapState(
        isReady: isReady ?? this.isReady,
        followUser: followUser ?? this.followUser,
        markers: markers ?? this.markers,
        controller: controller ?? this.controller,
      );
}
