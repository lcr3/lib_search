import 'dart:convert';

import 'package:lib_search_app/network/response/item.dart';
import 'package:lib_search_app/network/response/item_state.dart';
import 'package:lib_search_app/network/search_book_api_client.dart';


abstract class SearchBookRepository {
  Future<ItemState> searchBook(String searchKeyword);
}

class SearchBookRepositoryImpl implements SearchBookRepository {
  SearchBookRepositoryImpl(this._apiClient);

  final SearchBookApiClient _apiClient;

  @override
  Future<ItemState> searchBook(
      String searchKeyword) async {
    final responseBody = await _apiClient.get('');
    final jsonBody = json.decode(responseBody) as Map<String, dynamic>;
    final jsonList = (jsonBody['Items'] as List).cast<Map<String, dynamic>>();
    final list = jsonList.map(Item.fromCustomJson);
    return ItemState(items: list.toList());

    // for (final itemJson in decodedJson['items']) {
    //   repositoryList
    //       .add(RepositoryEntity.fromJson(itemJson as Map<String, dynamic>));
    // }
    // return repositoryList;
  }
}
