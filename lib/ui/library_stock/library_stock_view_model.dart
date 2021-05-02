
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:lib_search_app/network/entity/library_state.dart';
import 'package:lib_search_app/network/entity/library_stock_response.dart';
import 'package:lib_search_app/network/library_stock/library_stock_repository.dart';
import 'package:lib_search_app/util/lib_id_store.dart';

class LibraryStockViewModel extends ChangeNotifier {
  LibraryStockViewModel(this._libraryStockRepository, this._libIdStore, this.isbn) {
    // streamの監視開始
    _responseSuccessAction.stream.listen((response) {
      stockList = response.state;
      notifyListeners();
      // 監視終了
      _responseSuccessAction.close();
    });
    // 検索開始
    searchStock('');
  }
  static const _interval = 2;
  final LibraryStockRepository _libraryStockRepository;
  final LibIdStore _libIdStore;
  final String isbn;
  bool isLoading = false;
  List<LibraryState> stockList = <LibraryState>[];
  final _responseSuccessAction = StreamController<LibraryStockResponse>();
  // ignore: lines_longer_than_80_chars
  StreamController<LibraryStockResponse> get responseSuccessAction => _responseSuccessAction;

  Future<void> searchStock(String session) async {
    isLoading = true;
    final libIds = await _libIdStore.get();
    // ignore: lines_longer_than_80_chars
    await _libraryStockRepository.searchStock(session, isbn, libIds).then((response) {
      if (!response.isFinish()) {
        // インターバルをおいて再度リクエスト
        Future.delayed(const Duration(seconds: _interval), () {
          searchStock(response.session);
        });
        return;
      }

      isLoading = false;
      // streamに結果を流す
      _responseSuccessAction.sink.add(response);
    });
  }

  @override
  void dispose() {
    _responseSuccessAction.close();
    super.dispose();
  }
}