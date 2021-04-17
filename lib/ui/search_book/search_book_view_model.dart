
import 'package:hooks_riverpod/all.dart';
import 'package:lib_search_app/network/response/item_state.dart';
import 'package:lib_search_app/network/search_book_repository.dart';



class SearchBookViewModel extends StateNotifier<AsyncValue<ItemState>> {
  SearchBookViewModel(this._searchBookRepository)
      : super(const AsyncValue.loading()) {
    searchBookRequest('レガシーコードからの脱却');
  }

  final SearchBookRepository _searchBookRepository;

  Future<void> searchBookRequest(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      print('search keyword is null');
      return;
    }

    state = const AsyncValue.loading();
    try {
      final repositoryList =
        await _searchBookRepository.searchBook(searchKeyword);
      state = AsyncValue.data(repositoryList);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }

  void asapasap() {

  }
}
