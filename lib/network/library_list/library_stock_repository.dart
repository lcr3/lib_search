import 'package:lib_search_app/network/entity/library_stock_response.dart';
import 'library_stock_api_client.dart';

// ignore: one_member_abstracts
abstract class LibraryStockUseCase {
  Future<LibraryListResponse> searchStock(String isbn, List<String> libIds);
}

class LibraryStockRepository implements LibraryStockUseCase {
  LibraryStockRepository(this._apiClient);

  final LibraryStockApiClient _apiClient;

  @override
  Future<LibraryListResponse> searchStock(String isbn, List<String> libIds) async {
    try {
      final response = await _apiClient.searchStockPauling('', isbn, libIds);
      return response;
    } on FormatException catch(error) {
      return Future.error(error);
    } on Exception catch(error) {
      return Future.error(error);
    }
  }
}