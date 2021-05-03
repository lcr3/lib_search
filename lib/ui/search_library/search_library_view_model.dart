import 'package:flutter/cupertino.dart';
import 'package:lib_search_app/network/entity/library.dart';
import 'package:lib_search_app/network/search_library/search_library_repository.dart';
import 'package:lib_search_app/util/lib_id_store.dart';

class SearchLibraryViewModel extends ChangeNotifier {
  SearchLibraryViewModel(this._searchLibraryRepository, this._libIdStore);

  final SearchLibraryRepository _searchLibraryRepository;
  final LibIdStore _libIdStore;
  bool isLoading = false;
  List<Library> libraries = [];

  Future<void> searchLibrary(double latitude, double longitude) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    try {
        final libraryResponse =
        await _searchLibraryRepository.searchLibrary(latitude, longitude);
        libraries = libraryResponse;
        final libIds = libraries.map((library) => library.libId).toList();
        await _libIdStore.store(libIds);
        await _libIdStore.saveList(libraries);
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