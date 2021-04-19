import 'package:flutter/cupertino.dart';
import 'package:lib_search_app/network/entity/book.dart';
import 'package:lib_search_app/network/search_book_repository.dart';

class SearchBookViewModel extends ChangeNotifier {
  SearchBookViewModel(this._searchBookRepository) {
    // 初期化時に空でAPIをコール
    searchBookRequest('');
  }

  final SearchBookRepository _searchBookRepository;
  List<Book> searchResultList = <Book>[];
  bool isLoading = false;
  Exception? error;

  Future<void> searchBookRequest(String searchKeyword) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    try {
      final repositoryList =
        await _searchBookRepository.searchBook(searchKeyword);
      isLoading = false;
      searchResultList = repositoryList;
      print('modelは$searchResultList');
    } on Exception catch (error) {
      print('request error');
      isLoading = false;
      this.error = error;
      searchResultList = [];
    }
    // 変更通知
    notifyListeners();
  }
}

