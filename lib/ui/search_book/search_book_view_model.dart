import 'package:flutter/cupertino.dart';
import 'package:lib_search_app/network/entity/book.dart';
import 'package:lib_search_app/network/search_book_repository.dart';

class SearchBookViewModel extends ChangeNotifier {
  SearchBookViewModel(this._searchBookRepository) {
    searchBookRequest('');
  }

  final SearchBookRepository _searchBookRepository;
  List<Book> searchResultList = <Book>[];

  Future<void> searchBookRequest(String searchKeyword) async {
    try {
      final repositoryList =
        await _searchBookRepository.searchBook(searchKeyword);
      searchResultList = repositoryList;
    } on Exception catch (error) {
      print('request error');
      searchResultList = [];
    }
    notifyListeners();
  }
}

