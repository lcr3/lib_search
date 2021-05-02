
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'library_stock_list.dart';

class LibraryStockView extends StatelessWidget {
  const LibraryStockView({required this.isbn}) : super();
  final String isbn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StockList(isbn: isbn),
    );
  }
}