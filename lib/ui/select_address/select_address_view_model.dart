import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_search_app/network/entity/library.dart';
import 'package:lib_search_app/network/search_library/search_library_repository.dart';
import 'package:lib_search_app/util/lib_id_store.dart';
import 'package:location/location.dart';

class SelectAddressViewModel extends ChangeNotifier {
  SelectAddressViewModel(this._repository) {
    _getLocation();
    _locationChangedListen =
        _locationService.onLocationChanged.listen((LocationData result) async {
          print('取得');
          print(result);
      currentLocation = result;
      ChangeNotifier();
    });
  }

  final Location _locationService = Location();
  final SearchLibraryRepository _repository;

  // 現在位置
  LocationData? currentLocation;

  // // 現在位置の監視状況
  StreamSubscription? _locationChangedListen;

  @override
  void dispose() {
    super.dispose();
    // 監視を終了
    _locationChangedListen?.cancel();
    print('dispose');
  }

  Future<void> _getLocation() async {
    try {
      currentLocation = await _locationService.getLocation();
    } on PlatformException catch (e) {
      print(e);
    }
    ChangeNotifier();
  }

  Future<SelectAddressResponse> selectAddress() async {
    final latiude = currentLocation?.latitude;
    final longtiude = currentLocation?.longitude;
    if (latiude == null || longtiude == null) {
      return SelectAddressResponse(false, '位置情報の取得に失敗しました。');
    }
    try {
      final libraries = await _repository.searchLibrary(latiude, longtiude);
      _saveLibraries(libraries);
      return SelectAddressResponse(true, null);
    } on FormatException catch(error) {
      return SelectAddressResponse(false, error.message);
    } on Exception catch (_) {
      return SelectAddressResponse(false, 'exception');
    }
  }

  void _saveLibraries(List<Library> libraries) {
    // TODO: 抽象化
    final libIdStore = LibIdStore();
    final libIds = libraries.map((library) => library.systemId).toList();
    libIdStore.store(libIds);
    libIdStore.saveList(libraries);
  }
}

class SelectAddressResponse {
  // ignore: avoid_positional_boolean_parameters
  SelectAddressResponse(this.result, this.error);
  final bool result;
  final String? error;
}