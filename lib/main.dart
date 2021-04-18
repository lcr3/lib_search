
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_search_app/ui/search_book/search_book.dart';
import 'package:lib_search_app/ui/search_book/search_book_view_model.dart';

import 'network/search_book_api_client.dart';
import 'network/search_book_repository.dart';

// final apiClientProvider = Provider.autoDispose(
//       (_) => SearchBookApiClientImpl(),
// );
//
// final searchBookRepositoryProvider = Provider.autoDispose(
//       (ref) => SearchBookRepositoryImpl(ref.read(apiClientProvider)),
// );
//
// final searchBookViewModelProvider = StateNotifierProvider.autoDispose(
//       (ref) => SearchBookViewModel(ref.read(searchBookRepositoryProvider)),
// );

void main() {
  runApp(SearchBookView());
}