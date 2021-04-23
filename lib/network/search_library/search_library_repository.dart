import 'package:lib_search_app/network/entity/library.dart';
import 'package:lib_search_app/network/search_library/search_library_api_client.dart';

abstract class SearchLibraryUseCase {
  Future<List<Library>> searchLibrary(double latitude, double longitude);
}

class SearchLibraryRepository implements SearchLibraryUseCase {
  SearchLibraryRepository(this._apiClient);
  final SearchLibraryApiClient _apiClient;

  @override
  Future<List<Library>> searchLibrary(double latitude, double longitude) async {
    try {
      final response = await _apiClient.searchLibrary(latitude, longitude);
      return response;
    } on FormatException catch(error) {
      return Future.error(error);
    } on Exception catch(error) {
      return Future.error(error);
    }
  }
}