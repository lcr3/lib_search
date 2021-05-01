
import 'package:flutter/cupertino.dart';
import 'package:lib_search_app/network/entity/library_state.dart';
import 'package:lib_search_app/network/library_stock/library_stock_repository.dart';
import 'package:lib_search_app/util/lib_id_store.dart';

class LibraryStockViewModel extends ChangeNotifier {
  LibraryStockViewModel(this._libraryStockRepository, this._libIdStore, this.isbn) {
    searchStock(isbn);
  }

  final LibraryStockRepository _libraryStockRepository;
  final LibIdStore _libIdStore;
  final String isbn;
  bool isLoading = false;
  List<LibraryState> stockList = <LibraryState>[];

  Future<void> searchStock(String isbn) async {
    if (isLoading) {
      return;
    }
    isLoading = true;

    final libIds = _libIdStore.get() as List<String>;
    try {
      final response = await _libraryStockRepository.searchStock(
          '',
          isbn,
          libIds
      );
      if (response == null) {
        return;
      }
      stockList = response.state;
    } on FormatException catch(error) {
      print('request error');
    } on Exception catch (error) {
      print('exception');
    }
    isLoading = false;
    // 変更通知
    notifyListeners();
  }
}