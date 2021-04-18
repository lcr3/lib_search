
import 'package:flutter/cupertino.dart';
import 'package:lib_search_app/network/entity/item.dart';
import 'package:lib_search_app/network/search_book_repository.dart';

class SearchBookViewModel extends ChangeNotifier {
  var searchResultList = <Item>[];

  SearchBookViewModel(this._searchBookRepository) {
    searchBookRequest('レガシーコードからの脱却');
  }

  final SearchBookRepository _searchBookRepository;

  Future<void> searchBookRequest(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      print('search keyword is null');
      return;
    }

    try {
      final repositoryList =
        await _searchBookRepository.searchBook(searchKeyword);
      searchResultList = repositoryList;
    } on Exception catch (error) {
      print('request error');
      searchResultList = [];
      // state = AsyncValue.error(error);
    }
    notifyListeners();
  }
}