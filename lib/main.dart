import 'package:flutter/material.dart';
import 'package:lib_search_app/ui/search_book/search_book.dart';
import 'package:lib_search_app/ui/select_address/select_address.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => SelectAddressPage(),
        "/search_book": (BuildContext context) => SearchBookPage(),
      },
    );
  }
}