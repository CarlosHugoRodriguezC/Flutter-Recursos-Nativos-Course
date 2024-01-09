import 'dart:io';

import 'package:miscelaneos/presentation/providers/permissions/permissions_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:device_info_plus/device_info_plus.dart";
part 'permissions_provider.g.dart';

@Riverpod(keepAlive: true)
class Permissions extends _$Permissions {
  @override
  PermissionsState build() {
    checkPermissions();
    return PermissionsState();
  }

  Future<void> checkPermissions() async {
    final photoLibraryPermission = await getPhotoLibraryPermission();
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      photoLibraryPermission.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],
      sensors: permissionsArray[2],
      location: permissionsArray[3],
      locationAlways: permissionsArray[4],
      locationWhenInUse: permissionsArray[5],
    );
  }

  Future<Permission> getPhotoLibraryPermission() async {
    Permission permissionPhotoLibrary = Permission.photos;
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.version.sdkInt <= 32) {
        permissionPhotoLibrary = Permission.storage;
      }
    }

    return permissionPhotoLibrary;
  }

  Future<void> requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camera: status);

    await _checkPermissionStatus(status);
  }

  Future<void> requestPhotoLibraryAccess() async {
    final status = await (await getPhotoLibraryPermission()).request();
    state = state.copyWith(photoLibrary: status);

    await _checkPermissionStatus(status);
  }

  Future<void> requestSensorsAccess() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);

    await _checkPermissionStatus(status);
  }

  Future<void> requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);

    await _checkPermissionStatus(status);
  }

  Future<void> _checkPermissionStatus(PermissionStatus status) async {
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
