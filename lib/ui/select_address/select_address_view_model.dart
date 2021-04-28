import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class SelectAddressViewModel extends ChangeNotifier {
  SelectAddressViewModel() {
    _getLocation();
    _locationChangedListen =
        _locationService.onLocationChanged.listen((LocationData result) async {
      currentLocation = result;
      ChangeNotifier();
    });
  }

  final Location _locationService = Location();

  // 現在位置
  LocationData? currentLocation;

  // // 現在位置の監視状況
  StreamSubscription? _locationChangedListen;

  Future<void> _getLocation() async {
    try {
      currentLocation = await _locationService.getLocation();
    } on PlatformException catch (e) {
      print(e);
    }
    ChangeNotifier();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
    // 監視を終了
    _locationChangedListen?.cancel();
  }
}
