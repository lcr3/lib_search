import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_search_app/ui/search_book/search_book.dart';
import 'package:lib_search_app/ui/select_address/select_address.dart';
import 'package:lib_search_app/util/lib_id_store.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final libIdStore = LibIdStore();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: FutureBuilder(
        future: libIdStore.get(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
             return snapshot.data!.isNotEmpty ?
             SearchBookView() :
             SelectAddressView();
          }
          return SelectAddressView();
        },
      ),
    );
  }
}
