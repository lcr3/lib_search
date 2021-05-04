import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lib_search_app/network/search_library/search_library_api_client.dart';
import 'package:lib_search_app/network/search_library/search_library_repository.dart';
import 'package:lib_search_app/ui/search_book/search_book.dart';
import 'package:lib_search_app/ui/select_address/select_address_view_model.dart';
import 'package:provider/provider.dart';

class SelectAddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: const Color.fromRGBO(21, 233, 171, 1),
      ),
      home: MapView(),
      routes: <String, WidgetBuilder> {
        '/search_book': (BuildContext context) => SearchBookView(),
      },
    );
  }
}

class MapView extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchLibraryRepository = SearchLibraryRepository(
        SearchLibraryApiClient()
    );
    return ChangeNotifierProvider<SelectAddressViewModel>(
      create: (_) => SelectAddressViewModel(searchLibraryRepository),
      child: Consumer<SelectAddressViewModel>(
          builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('現在地を指定'),
              ),
              body: (model.currentLocation == null)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        Center(
                          child: GoogleMap(
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(model.currentLocation!.latitude!,
                                  model.currentLocation!.longitude!),
                              zoom: 18,
                            ),
                            onMapCreated: _controller.complete,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 1),
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 60,
                              right: 16,
                              left: 16,
                            ),
                            width: size.width,
                            height: 44,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).accentColor,
                                onPrimary: Colors.white,
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () async {
                                final response = await model.selectAddress();
                                if (response.result) {
                                  await Navigator.of(context).pushReplacementNamed('/search_book');
                                }
                              },
                              child: const Text('現在位置を設定'),
                            ),
                          ),
                        ),
                      ],
                    ))),
    );
  }
}
