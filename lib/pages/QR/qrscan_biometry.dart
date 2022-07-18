import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../addon.dart';

void main() {
  runApp(const QrBiometry());
}

class QrBiometry extends StatefulWidget {
  const QrBiometry({Key? key}) : super(key: key);

  @override
  State<QrBiometry> createState() => _QrBiometryState();
}

class _QrBiometryState extends State<QrBiometry> {
  final LocalAuthentication auth = LocalAuthentication();
  // _SupportState _supportState = _SupportState.unknown;
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    // auth.isDeviceSupported().then(
    //       (bool isSupported) => setState(() => _supportState = isSupported
    //           ? _SupportState.supported
    //           : _SupportState.unsupported),
    //     );
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    if (!mounted) {
      return;
    }
    if (authenticated) {
      Get.toNamed('/newPage');
    } else {
      showToast("Authentication Error", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              onPressed: _authenticateWithBiometrics,
              icon: Icon(Icons.fingerprint,
                  size: 50,
              ),
              ),
          ),
        ),
      ),
    );
  }
}

// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }
