import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lib_search_app/ui/select_address/select_address_view_model.dart';
import 'package:provider/provider.dart';

class SelectAddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: MapView(),
    );
  }
}

class MapView extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectAddressViewModel>(
      create: (_) => SelectAddressViewModel(),
      child: Consumer<SelectAddressViewModel>(
          builder: (context, model, child) => Scaffold(
                appBar: AppBar(
                  title: const Text('現在地を指定'),
                ),
                body: (model.currentLocation == null)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target: _getLocation(
                                model.currentLocation?.latitude,
                                model.currentLocation?.longitude),
                            zoom: 18,
                          ),
                          onMapCreated: _controller.complete,
                          myLocationEnabled: true,
                        ),
                      ),
              )),
    );
  }

  LatLng _getLocation(double? latitude, double? longitude) {
    if (latitude == null || longitude == null) {
      return const LatLng(35.6759323, 139.7450316);
    }
    return LatLng(latitude, longitude);
  }
}
