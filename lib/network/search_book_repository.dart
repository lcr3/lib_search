import 'dart:convert';

import 'package:lib_search_app/network/search_book_api_client.dart';

import 'entity/book.dart';

// ignore: one_member_abstracts
abstract class SearchBookRepository {
  Future<List<Book>> searchBook(String searchKeyword);
}

class SearchBookRepositoryImpl implements SearchBookRepository {
  SearchBookRepositoryImpl(this._apiClient);

  final SearchBookApiClient _apiClient;

  @override
  Future<List<Book>> searchBook(
      String searchKeyword) async {
    final responseBody = await _apiClient.get(searchKeyword);
    final jsonBody = json.decode(responseBody) as Map<String, dynamic>;
    final jsonList = (jsonBody['Items'] as List).cast<Map<String, dynamic>>();
    final list = jsonList.map(Book.fromCustomJson);
    var repositoryList = <Book>[];
    // ignore: join_return_with_assignment
    repositoryList = list.toList();
    return repositoryList;
  }
}
