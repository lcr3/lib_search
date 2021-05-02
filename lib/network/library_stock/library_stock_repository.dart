import 'package:lib_search_app/network/entity/library_stock_response.dart';
import 'library_stock_api_client.dart';

// ignore: one_member_abstracts
abstract class LibraryStockUseCase {
  Future<LibraryStockResponse> searchStock(
      String session,
      String isbn,
      List<String> libIds
      );
}

class LibraryStockRepository implements LibraryStockUseCase {
  LibraryStockRepository(this._apiClient);
  final LibraryStockApiClient _apiClient;

  @override
  Future<LibraryStockResponse> searchStock(String session,
      String isbn,
      List<String> libIds) async {
    try {
      final response = await _apiClient.searchStockPauling(
          session,
          isbn,
          libIds
      );
      if (!response.isFinish()) {
        // サーバー検索中
        return LibraryStockResponse(
            response.session,
            1,
            []
        );
      }
      return response;
    } on FormatException catch (error) {
      return Future.error(error);
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}