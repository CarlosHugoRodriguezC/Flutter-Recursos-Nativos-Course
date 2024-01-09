import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate({
    bool biometricsOnly = false,
  }) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to complete your transaction',
        options: AuthenticationOptions(
          biometricOnly: biometricsOnly,
        ),
      );

      final String message =
          didAuthenticate ? "Authenticated" : "Not Authenticated";

      return (didAuthenticate, message);
    } on PlatformException catch (e) {
      print(e);

      if (e.code == auth_error.notEnrolled) {
        return (
          false,
          "You need to set up biometric authentication in your device settings before using this feature",
        );
      }

      if (e.code == auth_error.lockedOut) return (false, "Not authorized");

      if (e.code == auth_error.notAvailable) {
        return (false, "This device does not support biometric authentication");
      }

      if (e.code == auth_error.passcodeNotSet) {
        return (
          false,
          "You need to set a pass code in order to use biometric authentication"
        );
      }

      if (e.code == auth_error.permanentlyLockedOut) {
        return (false, "Permanently locked out");
      }

      return (false, e.toString());
    }
  }
}
