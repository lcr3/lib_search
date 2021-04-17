
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lib_search_app/ui/search_book/search_book.dart';
import 'package:lib_search_app/ui/search_book/search_book_view_model.dart';

import 'model/controller/search_book_controller.dart';
import 'network/api_client.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'network/response/item.dart';
import 'network/search_book_api_client.dart';
import 'network/search_book_repository.dart';

final apiClientProvider = Provider.autoDispose(
      (_) => SearchBookApiClientImpl(),
);

final searchBookRepositoryProvider = Provider.autoDispose(
      (ref) => SearchBookRepositoryImpl(ref.read(apiClientProvider)),
);

final searchBookViewModelProvider = StateNotifierProvider.autoDispose(
      (ref) => SearchBookViewModel(ref.read(searchBookRepositoryProvider)),
);

void main() {
  // debugPaintSizeEnabled = false;
  runApp(
    ProviderScope(
      child: SearchBookView(),
    ),
  );
}